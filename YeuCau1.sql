use hackthon1;
insert into student(studentId, studentName, birthday, gender, address, phoneNumber)
values
    ('S001','Nguyễn Thế Anh','1999/1/1',0,'Hà Nội','984678082'),
    ('S002','Đặng Bảo Trâm','1998/12/22',1,'Lào Cai','904982654'),
    ('S003','Trần Hà Phương','2000/5/5',1,'Nghệ An','946645363'),
    ('S004','Đỗ Tiến Manh','1999/3/26',0,'Hà Nội','983665353'),
    ('S005','Phạm Duy Nhất','1999/10/4',0,'Tuyên Quang','987242678'),
    ('S006','Mai Văn Thái','1999/6/22',0,'Nam Định','982654268'),
    ('S007','Giang Gia Hân','1999/11/10',1,'Phu Thọ','982354753'),
    ('S008','Nguyễn Ngọc Bảo My','1999/1/22',1,'Ha Nam','927867453'),
    ('S009','Nguyễn Tiến Đạt','1999/8/7',0,'Tuyên Quang','989274673'),
    ('S010','Nguyễn Thiều Quang','1999/9/18',0,'Hà Nội','984378291');

insert into subject(SUBJECTID, SUBJECTNAME, PRIORITY)
values
    ('MH01','Toán',2),
    ('MH02','Vật lý',2),
    ('MH03','Hóa Học',1),
    ('MH04','Ngữ Văn',1),
    ('MH05','Tiếng Anh',2);

insert into Mark(studentId, subjectId, point)
values

    ('S001', 'MH01', 8.5),
    ('S001', 'MH02', 7),
    ('S001', 'MH03', 9),
    ('S001', 'MH04', 9),
    ('S001', 'MH05', 5),

    ('S002', 'MH01', 9),
    ('S002', 'MH02', 8),
    ('S002', 'MH03', 6.5),
    ('S002', 'MH04', 8),
    ('S002', 'MH05', 6),

    ('S003', 'MH01', 7.5),
    ('S003', 'MH02', 6.5),
    ('S003', 'MH03', 8),
    ('S003', 'MH04', 7),
    ('S003', 'MH05', 7),

    ('S004', 'MH01', 6),
    ('S004', 'MH02', 7),
    ('S004', 'MH03',5),
    ('S004', 'MH04',6.5),
    ('S004', 'MH05',8),

    ('S005', 'MH01', 5.5),
    ('S005', 'MH02', 8),
    ('S005', 'MH03',7.5),
    ('S005', 'MH04',8.5),
    ('S005', 'MH05',9),

    ('S006', 'MH01', 8),
    ('S006', 'MH02', 10),
    ('S006', 'MH03',9),
    ('S006', 'MH04',7.5),
    ('S006', 'MH05',6.5),

    ('S007', 'MH01', 9.5),
    ('S007', 'MH02', 9),
    ('S007', 'MH03',6),
    ('S007', 'MH04',9),
    ('S007', 'MH05',4),

    ('S008', 'MH01', 10),
    ('S008', 'MH02', 8.5),
    ('S008', 'MH03',8.5),
    ('S008', 'MH04',6),
    ('S008', 'MH05',9.5),

    ('S009', 'MH01', 7.5),
    ('S009', 'MH02', 7),
    ('S009', 'MH03',9),
    ('S009', 'MH04',5),
    ('S009', 'MH05',10),

    ('S010', 'MH01', 6.5),
    ('S010', 'MH02', 8),
    ('S010', 'MH03',5.5),
    ('S010', 'MH04',4),
    ('S010', 'MH05',7);

-- Cập nhật dữ liệu [10 điểm]:
UPDATE student
set studentName ='Đỗ Đức Manh'
where studentId = 'S004';

update subject
set subjectName = 'Ngoại Ngữ', priority = 1
where subjectId = 'MH05';

update mark
set point = case
    when subjectId = 'MH01' then 8.5
    when subjectId = 'MH02' then 7
    when subjectId = 'MH03' then 5.5
    when subjectId = 'MH04' then 6
    when subjectId = 'MH05' then 9
end
where studentId = 'S009';

-- Xoá dữ liệu[10 điểm]:
delete from mark
where studentId='S010';

delete from student
where studentId='S010';

# Bài 3: Truy vấn dữ liệu [25 điểm]:
# 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
select * from student;
# 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
    select subjectId , subjectName from subject
    where priority = 1;
# 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
# năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
select studentId as 'Mã học sinh', studentName as 'tên học sinh', year(curdate())-year(birthday) as Tuổi , if(gender=1,'Nữ','Nam') as 'Giới tính',address as 'Quê Quán' from student;
# 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
# Toán và sắp xếp theo điểm giảm dần. [4 điểm]
select s.studentName as 'Tên học sinh', s2.subjectName as 'Tên môn học' , point as 'Điểm thi' from mark
join student s on mark.studentId = s.studentId
join subject s2 on s2.subjectId = mark.subjectId
where subjectName = 'Toán'
order by point desc ;


# 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
# [4 điểm]
    select if(gender=1,'Nữ','Nam') as 'Giới tính' , count(studentId) as 'số lượng' from student
    group by gender;

# 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
# để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
select s.studentId, s.studentName, SUM(m.point) AS tongdiem, AVG(m.point) AS diemtrungbinh
from mark m
         join student s ON s.studentId = m.studentId
group by s.studentId, s.studentName;

# Bài 4: Tạo View, Index, Procedure [20 điểm]:
# Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
# sinh, giới tính , quê quán . [3 điểm]
create view STUDENT_VIEW as
    select studentId as 'Mã học sinh', studentName as 'Tên học sinh', if(gender = 1,'Nữ','Nam') as 'Giới tính', address as 'Địa điểm' from student;

# 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
# điểm trung bình các môn học . [3 điểm]
create view AVERAGE_MARK_VIEW as
    select student.studentId as 'Mã học sinh', studentName as 'Tên học sinh', avg(mark.point) as 'Điểm trung bình các môn' from student
        join mark on student.studentId = mark.studentId
group by student.studentId, studentName;

# 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create index idx_phoneNumber
    on Student (phoneNumber);


# 4. Tạo các PROCEDURE sau:
# - Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
# thông tin học sinh đó. [3 điểm]
delimiter &&
    create procedure PROC_INSERTSTUDENT (  instudentId varchar(4) ,
                                           instudentName varchar(100)  ,
                                           inbirthday date ,
                                           ingender bit(1)  ,
                                           inaddress text  ,
                                           inphoneNumber varchar(45))
    begin
        insert into student(studentId, studentName, birthday, gender, address, phoneNumber)
            values (instudentId,instudentName,inbirthday,ingender,inaddress,inphoneNumber);
    end &&
delimiter ;

call PROC_INSERTSTUDENT('S011', 'Nguyen Van A', '2001-01-01', 1, 'Hanoi', '0123456789');


# Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
# [3 điểm]
delimiter &&
create procedure PROC_UPDATESUBJECT( in_subjectId varchar(4),  in_newSubjectName varchar(45))
begin
    update Subject
    set subjectName = in_newSubjectName
    where subjectId = in_subjectId;
end &&
delimiter ;
insert into Subject(subjectId, subjectName, priority) values ('MH06', 'Code', 1);
call PROC_UPDATESUBJECT('MH06', 'Java');



# - Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
# sinh. [3 điểm]
delimiter &&
create procedure PROC_DELETEMARK (in_studentId varchar(4))
begin
    delete from mark
        where studentId = in_studentId;
end &&
delimiter ;
call PROC_DELETEMARK('S001');

