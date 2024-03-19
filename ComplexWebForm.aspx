<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplexWebForm.aspx.cs" Inherits="Coursework.ComplexWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style.css" rel="stylesheet"/>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .para {
            color: white;
        }

        .secondBody{
            padding: 35px;
            margin-top: -30px;
        }



        /* Style for the table */
        .table-container {
            margin: 0 auto;
            width: 80%;
        }
        /* Apply styles to GridView */
        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

            #GridView1 th, #GridView1 td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            #GridView1 th {
                background-color: #f2f2f2;
                color: black;
            }
        /* Apply styles to FormView */
        #FormView1 {
            width: 30%;
            margin: 20px auto;
            border: 1px solid #ddd;
            padding: 20px;
        }

            #FormView1 label {
                display: block;
                margin-bottom: 5px;
            }

            #FormView1 input[type="text"],
            #FormView1 input[type="date"] {
                width: calc(100% - 17px);
                padding: 6px;
                margin-bottom: 10px;
            }

            #FormView1 input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                cursor: pointer;
                border-radius: 3px;
            }

                #FormView1 input[type="submit"]:hover {
                    background-color: #45a049;
                }

        .navbar {
            overflow: hidden;
            background-color: #333;
        }

            .navbar a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 20px;
                text-decoration: none;
            }

                .navbar a:hover {
                    background-color: #ddd;
                }

                .navbar a.active {
                    background-color: #ddd;
                    color: black;
                }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".navbar a").click(function () {
                $(".navbar a").removeClass("active"); // Remove active class from all links
                $(this).addClass("active"); // Add active class to the clicked link
            });
        });
    </script>
</head>
<body>
    <div class="navbar">

          <a href="Dashboard.aspx"><div class="para"><span style="font-weight: bold; color: blue; font-size: 20px;">E</span>-Learning</div></a> 
        


        <div>

            <a href="Student.aspx" >Student</a>
            <a href="Course.aspx">Course</a>
            <a href="Lesson.aspx">Lesson</a>
            <a href="Instructor.aspx">Instructor</a>
            <a href="InstructorCourse.aspx">Instructor Course</a>
            <a href="Progress.aspx">Progress</a>
            <a href="Enrollment.aspx">Enrollment</a>
        </div>

    </div>

    <div class="secondBody">
    <form id="form1" runat="server">
        <div class="mainComplexDiv">
            <a href="ComplexWebForm.aspx" class="active complexWebForm">ComplexWebForm</a>

        </div>

        <center>
            <br />
            <br />
            <div>
                <strong style="font-size: 1.2rem">Complex Webform for  Student Enrollment</strong><br />
                <div class="customSelect">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT s.STUDENT_ID, s.STUDENT_NAME FROM STUDENT s, ENROLLMENT e WHERE s.STUDENT_ID = e.STUDENT_ID ORDER BY s.STUDENT_ID"></asp:SqlDataSource>
                </div>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                        <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                        <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                        <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                        <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                        <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" />
                        <asp:BoundField DataField="ENROLL_DATE" HeaderText="ENROLL_DATE" SortExpression="ENROLL_DATE" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" SELECT s.STUDENT_ID, s.STUDENT_NAME, s.CONTACT, s.EMAIL, s.DOB, s.COUNTRY, c.COURSE_ID, c.COURSE_NAME, e.ENROLL_DATE FROM STUDENT s, ENROLLMENT e, COURSE c WHERE s.STUDENT_ID = e.STUDENT_ID AND e.COURSE_ID = c.COURSE_ID AND (s.STUDENT_ID = :STUDENT_ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </div>
            <br />
            <br />
            <br />
            <div>
                <strong style="font-size: 1.2rem">Complex Webform for Course Instructor</strong><br />
                <div class="customSelect">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="COURSE_NAME" DataValueField="COURSE_ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT c.COURSE_ID, c.COURSE_NAME FROM COURSE c, INSTRUCTOR_COURSE ci WHERE c.COURSE_ID = ci.COURSE_ID ORDER BY c.COURSE_ID"></asp:SqlDataSource>
                </div>

                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,INSTRUCTOR_ID" DataSourceID="SqlDataSource4">
                    <Columns>
                        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                        <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" />
                        <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                        <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.Course_Id, c.Course_name, i.Instructor_id, i.Instructor_name FROM Course c JOIN Instructor_course ci ON c.Course_Id = ci.Course_Id JOIN Instructor i ON ci.Instructor_Id = i.Instructor_Id WHERE c.Course_Id = :Course_ID AND i.Instructor_Id IN (SELECT Instructor_Id FROM Instructor_course GROUP BY Instructor_Id HAVING COUNT(Course_Id) &gt;= 2) ORDER BY c.Course_Id, i.Instructor_Id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="course_id" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />

            </div>

            <div>
                <strong style="font-size: 1.2rem">Best E-Learning Course</strong><br />
                <div class="customSelect">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="MONTH_NAME" DataValueField="MONTH_ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" SELECT DISTINCT EXTRACT(MONTH FROM enroll_date) AS month_id, TO_CHAR(enroll_date, 'Month') AS month_name FROM Enrollment ORDER BY EXTRACT(MONTH FROM enroll_date)"></asp:SqlDataSource>
                </div>

                <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource5" CssClass="GridViewStyle" AutoGenerateColumns="False" DataKeyNames="COURSE_ID">
                    <Columns>
                        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                        <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" />
                        <asp:BoundField DataField="TOTALENROLLMENTS" HeaderText="TOTALENROLLMENTS" SortExpression="TOTALENROLLMENTS" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.course_id,c.course_name,COUNT(e.student_id) AS totalenrollments FROM Course c JOIN Enrollment e ON c.course_id = e.course_id WHERE EXTRACT(MONTH FROM e.enroll_date) = :Month_Id AND EXTRACT(YEAR FROM e.enroll_date) = 2024 GROUP BY c.course_id, c.course_name ORDER BY totalenrollments DESC FETCH FIRST 3 ROWS ONLY">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="Month_Id" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </div>


        </center>

    </form>

    </div>


</body>
</html>
