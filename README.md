Vehicle Rental System Database Design And Some Query Questions & Answers With Postgres Sql.
First we will create a database with CREATE DATABASE vehicle rental databse this command. Then we follow same procedure and create three table that's Users, Vehicles and Bookings.
We will run our all code is vs code. Then read the problem and first will will make a ER diagram in any tools. So we use lucid.app for making this ER diagram. This diagram link is bellow.

ERD Link: https://lucid.app/lucidchart/7c290cea-6289-478a-8668-74ad99d6b28a/edit?invitationId=inv_d4983981-136c-4d25-8f46-0377edce0278&page=0_0#

Now will solve this problem.

Question 1
What is a foreign key and why is it important in relational databases?

ANS: Foreign Key হলো একটি টেবিলের এমন একটি কলাম বা একাধিক কলাম, যা অন্য একটি টেবিলের Primary Key-কে রেফার করে।
এর মাধ্যমে দুইটি টেবিলের মধ্যে relationship (সম্পর্ক) তৈরি হয়।

Question 2
What is the difference between WHERE and HAVING clauses in SQL?

ANS: WHERE clause
রেকর্ড (row) ফিল্টার করতে ব্যবহৃত হয়
GROUP BY এর আগে কাজ করে
Aggregate function (COUNT, SUM, AVG ইত্যাদি) ব্যবহার করা যায় না

HAVING clause
গ্রুপ করা ডেটা (group) ফিল্টার করতে ব্যবহৃত হয়
GROUP BY এর পরে কাজ করে
Aggregate function ব্যবহার করা যায়

Question 3
What is a primary key and what are its characteristics?

ANS: Primary Key হলো একটি টেবিলের এমন একটি কলাম বা একাধিক কলাম, যা টেবিলের প্রতিটি রেকর্ডকে uniquely চিহ্নিত করে।

Primary Key-এর বৈশিষ্ট্যসমূহ:

Unique – প্রতিটি মান আলাদা হতে হবে, একই মান একাধিকবার থাকতে পারবে না।
NOT NULL – কখনোই খালি (NULL) হতে পারবে না।
প্রতিটি টেবিলে একটি Primary Key থাকে একাধিক Primary Key থাকতে পারে না।
রেকর্ড সনাক্ত করে – প্রতিটি row কে আলাদা করে চেনার জন্য ব্যবহৃত হয়।
Foreign Key এর সাথে সম্পর্ক তৈরি করে অন্য টেবিলের Foreign Key এই Primary Key কে রেফার করে।

Question 4
What is the difference between INNER JOIN and LEFT JOIN in SQL?

ANS: SQL এর মধ্যে INNER JOIN এবং LEFT JOIN এর পার্থক্য :

INNER JOIN
1.দুইটি টেবিলে যেসব রেকর্ডে মিল আছে, শুধু সেগুলোই দেখায় ।
2.মিল না থাকলে কোনো রেকর্ড দেখায় না ।

LEFT JOIN
1.বাম টেবিলের সব রেকর্ড দেখায়।
2.ডান টেবিলে মিল না থাকলে সেই কলামগুলোতে NULL দেখায় ।

























