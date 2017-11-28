CREATE DEFINER=`ezhai24`@`%` PROCEDURE `uspAddReqs`(IN RqName varchar(100), IN MjrName varchar(100))
BEGIN
	DECLARE MjrId INT;
    DECLARE RqId INT;
    SET MjrId = (SELECT MajorID FROM MAJOR WHERE MajorName = MjrName);

	START TRANSACTION;
		INSERT INTO REQ(ReqName)
		VALUES(RqName);
		
		SET RqId = LAST_INSERT_ID();
		
		INSERT INTO MAJOR_REQ(ReqID, MajorID)
		VALUES(RqId, MjrId);
	COMMIT;
END