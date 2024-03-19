<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Progress.aspx.cs" Inherits="Coursework.Progress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <style>

 body {
     font-family: 'Poppins', sans-serif;
     margin: 0;
     padding: 0;
 }

 .navbar{
     display: flex;
     justify-content:space-around;
     align-items:center;
 }

 .para{
    color:white;
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
     color:black;
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


.secondBody{
            padding: 35px;
            margin-top: -30px;
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
    $(document).ready(function(){
        $(".navbar a").click(function(){
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

        <a href="Student.aspx">Student</a>
        <a href="Course.aspx" >Course</a>
        <a href="Lesson.aspx" >Lesson</a>
        <a href="Instructor.aspx">Instructor</a>
        <a href="InstructorCourse.aspx" >Instructor Course</a>
        <a href="Progress.aspx" class="active">Progress</a>
        <a href="Enrollment.aspx" >Enrollment</a>
       </div>
     
  </div>
    <div class="mainComplexDiv">
    <a href="ComplexWebForm.aspx" class="complexWebForm">ComplexWebForm</a>

</div>

    <div class="secondBody">
     <h2 style="margin-left: 12px;">Progress Table</h2>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" DataKeyNames="COURSE_ID,LESSON_NO,STUDENT_ID">
            <Columns>
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" ReadOnly="True" SortExpression="LESSON_NO" />
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE" />
                <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROGRESS&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;PROGRESS&quot; (&quot;COURSE_ID&quot;, &quot;LESSON_NO&quot;, &quot;STUDENT_ID&quot;, &quot;LAST_ACCESSED_DATE&quot;, &quot;LESSON_STATUS&quot;) VALUES (:COURSE_ID, :LESSON_NO, :STUDENT_ID, :LAST_ACCESSED_DATE, :LESSON_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROGRESS&quot;" UpdateCommand="UPDATE &quot;PROGRESS&quot; SET &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE, &quot;LESSON_STATUS&quot; = :LESSON_STATUS WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                <asp:Parameter Name="LESSON_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                <asp:Parameter Name="LESSON_STATUS" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROGRESS&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;PROGRESS&quot; (&quot;COURSE_ID&quot;, &quot;LESSON_NO&quot;, &quot;STUDENT_ID&quot;, &quot;LAST_ACCESSED_DATE&quot;, &quot;LESSON_STATUS&quot;) VALUES (:COURSE_ID, :LESSON_NO, :STUDENT_ID, :LAST_ACCESSED_DATE, :LESSON_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROGRESS&quot;" UpdateCommand="UPDATE &quot;PROGRESS&quot; SET &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE, &quot;LESSON_STATUS&quot; = :LESSON_STATUS WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                <asp:Parameter Name="LESSON_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                <asp:Parameter Name="LESSON_STATUS" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROGRESS&quot;"></asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource4" DataKeyNames="COURSE_ID,LESSON_NO,STUDENT_ID">
            <EditItemTemplate>
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                LESSON_NO:
                <asp:Label ID="LESSON_NOLabel1" runat="server" Text='<%# Eval("LESSON_NO") %>' />
                <br />
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                LAST_ACCESSED_DATE:
                <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
                <br />
                LESSON_STATUS:
                <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                COURSE_ID:
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' />
                <br />
                LESSON_NO:
                <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' />
                <br />
                STUDENT_ID:
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                <br />
                LAST_ACCESSED_DATE:
                <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
                <br />
                LESSON_STATUS:
                <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                LESSON_NO:
                <asp:Label ID="LESSON_NOLabel" runat="server" Text='<%# Eval("LESSON_NO") %>' />
                <br />
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                LAST_ACCESSED_DATE:
                <asp:Label ID="LAST_ACCESSED_DATELabel" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
                <br />
                LESSON_STATUS:
                <asp:Label ID="LESSON_STATUSLabel" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                <br />

                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"/>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New"/>

            </ItemTemplate>
        </asp:FormView>
    </form>


    </div>
</body>
</html>
