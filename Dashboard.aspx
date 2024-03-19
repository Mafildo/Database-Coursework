<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Coursework.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/solid.min.css" integrity="sha512-pZlKGs7nEqF4zoG0egeK167l6yovsuL8ap30d07kA5AJUq+WysFlQ02DLXAmN3n0+H3JVz5ni8SJZnrOaYXWBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="style.css" rel="stylesheet" />
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

        .secondBody {
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

        #Chart2{
            background-color: red;
            border: 1px solid black;
        }

        .listItems {
            display: flex;
            flex-wrap: wrap;
            gap: 50px;
            margin-top: 20px;
            margin-left: 30px;
        }

        .items {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 250px;
            height: 250px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

            .items:hover {
                transform: scale(1.05);
                transition: 0.2s ease-in-out;
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
                    background-color: none;
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

    <form id="form1" runat="server">

        <div class="navbar">

            <a href="Dashboard.aspx" class="active">
                <div class="para"><span style="font-weight: bold; color: blue; font-size: 20px;">E</span>-Learning</div>
            </a>


            <div>

                <a href="Student.aspx">Student</a>
                <a href="Course.aspx">Course</a>
                <a href="Lesson.aspx">Lesson</a>
                <a href="Instructor.aspx">Instructor</a>
                <a href="InstructorCourse.aspx">Instructor Course</a>
                <a href="Progress.aspx">Progress</a>
                <a href="Enrollment.aspx">Enrollment</a>
            </div>

        </div>

        <div class="mainComplexDiv">
            <a href="ComplexWebForm.aspx" class="complexWebForm">ComplexWebForm</a>

        </div>
        <div class="listItems">
            <div class="listItems">

                <a href="Student.aspx" style="text-decoration: none; color: black;">
                    <div class="items" style="background-color: lightgreen; font-size: 20px">

                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>

                                <span style="font-size: 35px;">
                                    <asp:Label ID="STUDENTLabel" runat="server" Text='<%# Eval("STUDENT") %>' /></span>
                                <br />
                                <br />
                                STUDENT <span style="color: floralwhite; margin-left: 15px; font-size: 35px;"><i class="fas fa-user"></i></span>

                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Student FROM Student"></asp:SqlDataSource>

                    </div>
                </a>



                <a href="Course.aspx" style="text-decoration: none; color: black;">
                    <div class="items" style="background-color: lightgreen; font-size: 20px">

                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <span style="font-size: 35px;">
                                    <asp:Label ID="COURSELabel" runat="server" Text='<%# Eval("COURSE") %>' /></span>
                                <br />
                                <br />

                                COURSE <span style="color: floralwhite; margin-left: 15px; font-size: 35px;"><i class="fas fa-book"></i></span>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Course FROM Course"></asp:SqlDataSource>

                    </div>
                </a>


                <a href="Lesson.aspx" style="text-decoration: none; color: black;">
                    <div class="items" style="background-color: lightgreen; font-size: 20px">

                        <br />
                        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                <span style="font-size: 35px;">
                                    <asp:Label ID="LESSONLabel" runat="server" Text='<%# Eval("LESSON") %>' /></span>
                                <br />
                                <br />

                                LESSON  <span style="color: floralwhite; margin-left: 15px; font-size: 35px;"><i class="fas fa-file"></i></span>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Lesson FROM Lesson
"></asp:SqlDataSource>
                    </div>
                </a>

                <a href="Instructor.aspx" style="text-decoration: none; color: black;">
                    <div class="items" style="background-color: lightgreen; font-size: 20px">

                        <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <span style="font-size: 35px;">
                                    <asp:Label ID="INSTRUCTORLabel" runat="server" Text='<%# Eval("INSTRUCTOR") %>' /></span>
                                <br />
                                <br />

                                INSTRUCTOR <span style="color: floralwhite; margin-left: 15px; font-size: 35px;"><i class="fas fa-user-friends"></i></span>

                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Instructor FROM Instructor
"></asp:SqlDataSource>
                    </div>
                </a>


                <a href="Progress.aspx" style="text-decoration: none; color: black;">
                    <div class="items" style="background-color: lightgreen; font-size: 20px">

                        <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                <span style="font-size: 35px;">
                                    <asp:Label ID="PROGRESSLabel" runat="server" Text='<%# Eval("PROGRESS") %>' /></span>
                                <br />
                                <br />

                                PROGRESS <span style="color: floralwhite; margin-left: 15px; font-size: 35px;"><i class="fas fa-chart-bar"></i></span>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Progress FROM Progress 
"></asp:SqlDataSource>
                        <br />
                        <br />


                    </div>
                </a>


            </div>

            <div style="height: 306px; width: 100%; border: 1px solid black;">
            <center>
                
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="STUDENT_ID" YValueMembers="ENROLL_DATE">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ENROLLMENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;ENROLLMENT&quot; (&quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;ENROLL_DATE&quot;) VALUES (:STUDENT_ID, :COURSE_ID, :ENROLL_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ENROLLMENT&quot;" UpdateCommand="UPDATE &quot;ENROLLMENT&quot; SET &quot;ENROLL_DATE&quot; = :ENROLL_DATE WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="STUDENT_ID" Type="String" />
                            <asp:Parameter Name="COURSE_ID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="STUDENT_ID" Type="String" />
                            <asp:Parameter Name="COURSE_ID" Type="String" />
                            <asp:Parameter Name="ENROLL_DATE" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ENROLL_DATE" Type="DateTime" />
                            <asp:Parameter Name="STUDENT_ID" Type="String" />
                            <asp:Parameter Name="COURSE_ID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                
                </center>

            </div>
    </form>

</body>
</html>
