-- 1.What should be done to make users pair insertion unique i.e. to avoid duplicate user relationship creation?
Add PRIMARY KEY (`user_one_id`, `user_two_id`)

-- 2.What will be the insert query to insert a new Friend request sent by user 1 to user 2?
INSERT INTO `relationship` (`user_one_id`, `user_two_id`, `status`, `action_user_id`) VALUES
	(1, 2, 0, 1);
	
-- 3.What will be the query to update the status of the friend requesti.e. accepting friend request sent to user 2 by user 1?
UPDATE `relationship` SET `status`=1,`action_user_id`=2
WHERE `user_one_id`=1 AND `user_two_id`=2;

-- 4.What will be the query to check if any two users are friends?
SELECT * FROM relationship WHERE user_one_id = 1 AND user_two_id = 2 AND status = 1;

-- 5.What will be the query to retrieve all the users’ friends?Here user 1 is the logged in user.
SELECT * FROM relationship WHERE (user_one_id = 1 OR user_two_id = 1) AND status = 1;

-- 6.What will be query to get the entire pending user request for the user from other users?Here user 1 is logged in.
SELECT * FROM relationship WHERE (user_one_id = 1 OR user_two_id = 1) AND status = 0 AND action_user_id != 1;

-- 7.What will be the query to retrieve the friend request status when the logged in user visits the profile of another user?Here, user 1 is the logged in user. User 1 visits the profile of user7.
SELECT * FROM relationship WHERE user_one_id = 1 AND user_two_id = 7;
