<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Coursework.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <title></title>
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
      <a href="Course.aspx" class="active">Course</a>
      <a href="Lesson.aspx" >Lesson</a>
      <a href="Instructor.aspx">Instructor</a>
      <a href="InstructorCourse.aspx" >Instructor Course</a>
      <a href="Progress.aspx" >Progress</a>
      <a href="Enrollment.aspx" >Enrollment</a>
     </div>
   
</div>
    <div class="mainComplexDiv">
    <a href="ComplexWebForm.aspx" class="complexWebForm">ComplexWebForm</a>

</div>

    <div class="secondBody">
    <form id="form1" runat="server">
         <h2 style="margin-left: 12px;">Course Table</h2>
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot;) VALUES (:COURSE_ID, :COURSE_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_NAME&quot; = :COURSE_NAME WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="COURSE_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_NAME" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                COURSE_NAME:
                <asp:TextBox ID="COURSE_NAMETextBox" runat="server" Text='<%# Bind("COURSE_NAME") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                COURSE_ID:
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' />
                <br />
                COURSE_NAME:
                <asp:TextBox ID="COURSE_NAMETextBox" runat="server" Text='<%# Bind("COURSE_NAME") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                COURSE_NAME:
                <asp:Label ID="COURSE_NAMELabel" runat="server" Text='<%# Bind("COURSE_NAME") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"  style="background-color: #007bff; color: #ffffff; border: none; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 4px;" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  style="background-color: #007bff; color: #ffffff; border: none; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 4px;"/>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New"  style="background-color: #007bff; color: #ffffff; border: none; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 4px;"/>
            </ItemTemplate>
        </asp:FormView>
    </form>

    </div>
</body>
</html>
