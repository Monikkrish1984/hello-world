USE [ProjectManagerDB]
GO

/****** Object:  Table [dbo].[Tasks]    Script Date: 28-09-2019 23:51:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Priority] [int] NULL,
	[IsParentTask] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[ParentTaskId] [int] NULL,
	[ProjectId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO

ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Projects_ProjectId]
GO

ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Tasks_ParentTaskId] FOREIGN KEY([ParentTaskId])
REFERENCES [dbo].[Tasks] ([Id])
GO

ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Tasks_ParentTaskId]
GO

ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_UserId]
GO


