<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Coursework.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />

    <style>
        /* Apply Poppins font to body */
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
            padding: 10px;
            border-radius: 5px;
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
                    color: black;
                }

                .navbar a.active {
                    background-color: #ddd;
                    color: black;
                }

        .secondBody{
            padding: 35px;
            margin-top: -30px;
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

            <a href="Student.aspx" class="active">Student</a>
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

    <div class="secondBody">
    <form id="form1" runat="server">
        <div>
        </div>
        <h2 style="margin-left: 12px;">Student Table</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />

            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT&quot;" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;COUNTRY&quot;, &quot;DOB&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :CONTACT, :EMAIL, :COUNTRY, :DOB)" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL&quot; = :EMAIL, &quot;COUNTRY&quot; = :COUNTRY, &quot;DOB&quot; = :DOB WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="Decimal" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="Decimal" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" ForeColor="Black">
            <EditItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                STUDENT_NAME:
                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' />
                <br />
                CONTACT:
                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                <br />
                EMAIL:
                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                <br />
                COUNTRY:
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="white" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                <br />
                STUDENT_NAME:
                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' />
                <br />
                CONTACT:
                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                <br />
                EMAIL:
                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                <br />
                COUNTRY:
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                STUDENT_NAME:
                <asp:Label ID="STUDENT_NAMELabel" runat="server" Text='<%# Bind("STUDENT_NAME") %>' />
                <br />
                CONTACT:
                <asp:Label ID="CONTACTLabel" runat="server" Text='<%# Bind("CONTACT") %>' />
                <br />
                EMAIL:
                <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
                <br />
                COUNTRY:
                <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Bind("COUNTRY") %>' />
                <br />
                DOB:
                <asp:Label ID="DOBLabel" runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:FormView>
    </form>

    </div>

</body>
</html>
