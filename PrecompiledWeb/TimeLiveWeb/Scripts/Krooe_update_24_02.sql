

/****** Object:  StoredProcedure [dbo].[AssignToUser]    Script Date: 02/24/2013 17:16:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssignToUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AssignToUser]
GO


CREATE PROCEDURE [dbo].[AssignToUser]
	-- Add the parameters for the stored procedure here
@UserId bigint,
@TaskID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Declare @AccountID bigint

SELECT @AccountID =[AccountId]  FROM [dbo].[AccountEmployee]
where AccountEmployeeId = @UserId 



INSERT INTO [dbo].[AccountProjectTaskEmployee]
           ([AccountId]
           ,[AccountProjectTaskId]
           ,[AccountEmployeeId]
           ,[AllocationUnits])
     VALUES
           (@AccountID 
           ,@TaskID 
           ,@UserId 
           ,0)


END
GO

/****** Object:  StoredProcedure [dbo].[InsertTaskForSync]    Script Date: 02/24/2013 17:17:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertTaskForSync]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertTaskForSync]
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


/****** Object:  StoredProcedure [dbo].[FullDeleteTask]    Script Date: 02/24/2013 17:17:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FullDeleteTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FullDeleteTask]
GO



CREATE PROCEDURE [dbo].[FullDeleteTask]
	-- Add the parameters for the stored procedure here
@GCEventId nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Declare @TaskId int
Declare @Id int

Select  @Id= ID, @TaskId = TaskId from dbo.AccountTaskSyncInfo where GoogleEventID =@GCEventId
    Delete from dbo.AccountProjectTask where AccountProjectTaskId = @TaskId
    Delete from dbo.AccountTaskSyncInfo where Id =@id
END
GO



/****** Object:  Trigger [InsertTaskSync]    Script Date: 02/24/2013 17:14:50 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[InsertTaskSync]'))
DROP TRIGGER [dbo].[InsertTaskSync]
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

   INSERT INTO [dbo].[AccountTaskSyncInfo]
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


/****** Object:  Trigger [UpdateTaskSync]    Script Date: 02/24/2013 17:15:10 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[UpdateTaskSync]'))
DROP TRIGGER [dbo].[UpdateTaskSync]
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


/****** Object:  Trigger [DeleteTaskSybc]    Script Date: 02/24/2013 17:13:58 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[DeleteTaskSybc]'))
DROP TRIGGER [dbo].[DeleteTaskSybc]
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

