<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enrollment.aspx.cs" Inherits="Coursework.Enrollment1" %>

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

         .secondBody{
            padding: 35px;
            margin-top: -30px;
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
      <a href="Progress.aspx" >Progress</a>
      <a href="Enrollment.aspx" class="active">Enrollment</a>
     </div>
   
</div>
    <div class="mainComplexDiv">
    <a href="ComplexWebForm.aspx" class="complexWebForm">ComplexWebForm</a>

</div>

    <div class="secondBody">
        <h2 style="margin-left: 12px;">Enrollment Table</h2>

    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="STUDENT_ID,COURSE_ID">
            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" ReadOnly="True" />
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" ReadOnly="True" />
                <asp:BoundField DataField="ENROLL_DATE" HeaderText="ENROLL_DATE" SortExpression="ENROLL_DATE" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ENROLLMENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;ENROLLMENT&quot; (&quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;ENROLL_DATE&quot;) VALUES (:STUDENT_ID, :COURSE_ID, :ENROLL_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ENROLLMENT&quot;" UpdateCommand="UPDATE &quot;ENROLLMENT&quot; SET &quot;ENROLL_DATE&quot; = :ENROLL_DATE WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID">
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ENROLLMENT&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3" DataKeyNames="STUDENT_ID,COURSE_ID">
            <EditItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                ENROLL_DATE:
                <asp:TextBox ID="ENROLL_DATETextBox" runat="server" Text='<%# Bind("ENROLL_DATE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                <br />
                COURSE_ID:
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' />
                <br />
                ENROLL_DATE:
                <asp:TextBox ID="ENROLL_DATETextBox" runat="server" Text='<%# Bind("ENROLL_DATE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                ENROLL_DATE:
                <asp:Label ID="ENROLL_DATELabel" runat="server" Text='<%# Bind("ENROLL_DATE") %>' />
                <br />

                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"  style="background-color: #007bff; color: #ffffff; border: none; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 4px;"/>
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  style="background-color: #007bff; color: #ffffff; border: none; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 4px;" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New"  style="background-color: #007bff; color: #ffffff; border: none; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 4px;" />

            </ItemTemplate>
        </asp:FormView>
    </form>

    </div>

</body>
</html>
