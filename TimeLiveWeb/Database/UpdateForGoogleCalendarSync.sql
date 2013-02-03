
CREATE TABLE [dbo].[AccountGCDefProject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[MileStoneID] [int] NOT NULL,
 CONSTRAINT [PK_AccountGCDefProject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



CREATE TABLE [dbo].[AccountGoogleCalendar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GoogleAccountId] [nvarchar](100) NOT NULL,
	[DefaultCalendarId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AccountGoogleCalendar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[AccountTaskSyncInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskId] [bigint] NOT NULL,
	[GoogleEventID] [nvarchar](100) NULL,
	[MD5Hash] [nvarchar](50) NULL,
	[isDeleted] [bit] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountTaskSyncInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AccountTaskSyncInfo] ADD  CONSTRAINT [DF_AccountTaskSyncInfo_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO



CREATE TRIGGER [dbo].[DeleteTaskSybc]
   ON [dbo].[AccountProjectTask]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Declare @id int

Select @id = AccountProjectTaskId from deleted

Update dbo.AccountTaskSyncInfo set isDeleted=1 where TaskId=@id
    -- Insert statements for trigger here

END

GO

CREATE TRIGGER [dbo].[InsertTaskSync]
   ON [dbo].[AccountProjectTask]  
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Declare @ID int

Select @ID = AccountProjectTaskId from inserted

   INSERT INTO [TimeLive].[dbo].[AccountTaskSyncInfo]
           ([TaskId]
           ,[GoogleEventID]
           ,[MD5Hash]
           ,[isDeleted]
           ,[LastUpdate])
     VALUES
           (@ID
           ,NULL
           ,NULL
           ,0
           ,GetDate())


END

GO

CREATE TRIGGER [dbo].[UpdateTaskSync]
   ON  [dbo].[AccountProjectTask]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for trigger here
Declare @id int

Select @id = AccountProjectTaskId from inserted
UPDATE [dbo].[AccountTaskSyncInfo]
   SET [LastUpdate] = GetUTCDATE()
 WHERE TaskId =@id


END

GO


CREATE VIEW [dbo].[vueAccountTasksForSync]
AS
SELECT     dbo.AccountProject.AccountId, dbo.AccountTaskSyncInfo.TaskId, dbo.AccountTaskSyncInfo.GoogleEventID, dbo.AccountTaskSyncInfo.MD5Hash, dbo.AccountTaskSyncInfo.isDeleted, 
                      dbo.AccountTaskSyncInfo.LastUpdate, dbo.AccountTaskSyncInfo.Id, dbo.AccountProjectTask.TaskName, dbo.AccountProjectTask.TaskDescription, dbo.AccountProjectTask.ModifiedOn, 
                      dbo.AccountProjectTask.CreatedOn, dbo.AccountProjectTask.StartDate, dbo.AccountProjectTask.Duration, dbo.AccountProjectTask.DurationUnit, dbo.AccountProjectTask.DeadlineDate
FROM         dbo.AccountProjectTask INNER JOIN
                      dbo.AccountProject ON dbo.AccountProjectTask.AccountProjectId = dbo.AccountProject.AccountProjectId RIGHT OUTER JOIN
                      dbo.AccountTaskSyncInfo ON dbo.AccountProjectTask.AccountProjectTaskId = dbo.AccountTaskSyncInfo.TaskId

GO


CREATE PROCEDURE [dbo].[InsertTaskForSync]
	-- Add the parameters for the stored procedure here
@AccountProjectId int,
@TaskName nvarchar(200),
@TaskDescription nvarchar(4000),
@DeadlineDate datetime,
@AccountProjectMilestoneId int,
@CreatedOn datetime,
@CreatedByEmployeeId int,
@ModifiedOn datetime,
@ModifiedByEmployeeId int,
@AccountBillingRateId int,
@TaskCode nvarchar(30),
@StartDate datetime,
@Id int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO AccountProjectTask
                         (AccountProjectId, ParentAccountProjectTaskId, TaskName, TaskDescription, AccountTaskTypeId, Duration, DurationUnit, DeadlineDate, CompletedPercent, 
                         Completed, IsParentTask, IsForAllEmployees, AccountPriorityId, TaskStatusId, AccountProjectMilestoneId, IsReOpen, CreatedOn, CreatedByEmployeeId, 
                         ModifiedOn, ModifiedByEmployeeId, EstimatedCost, EstimatedTimeSpent, EstimatedTimeSpentUnit, IsBillable, IsDisabled, AccountBillingRateId, 
                         IsForAllProjectTask, TaskCode, AccountProjectTaskTemplateId, EstimatedCurrencyId, StartDate, Predecessors)
VALUES        (@AccountProjectId, NULL,@TaskName,@TaskDescription, 2, 0, N'Days',@DeadlineDate, 0, 0, 0, 0, 1, 1,@AccountProjectMilestoneId, 
                         0,@CreatedOn,@CreatedByEmployeeId,@ModifiedOn,@ModifiedByEmployeeId, 0, 0, NULL, 1, 0,@AccountBillingRateId, 0,@TaskCode, NULL, 
                         1,@StartDate, NULL)
                         
                         Select @Id= TaskID from dbo.AccountTaskSyncInfo where Id=@@Identity
    
END

GO

