<%@ Page Language="VB" Title="The Team" MasterPageFile="~/Site.Master"  AutoEventWireup="false" CodeFile="theteam.aspx.vb" Inherits="theteam" %>

<asp:Content runat="server" ID="TheTeam" ContentPlaceHolderID="MainContent" >
        <%--*********************************************************************
         Bug fixed by Jonathan H. (in theteam.aspx only; see other pages for more comments and bug fixes)
         -------------------------------
         -create theteam.aspx page to list tasks and roles
         -Prevent unnecessary calls to server
         -Use pure styling functionality for faster loading
         -Verify styling from master page is inherited properly
         -Verify responsiveness functionality on smaller devices and phones

    *********************************************************************--%>
    <p><strong>Broward College Survey</strong></p>  
       <p>Group One 2014 - Tasks and Roles </p>
    <hr />
    <ul class="media-list">
         <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Maria Alejandra Batista</h4>
             <%-- ----------------------Maria Alejandra BatistaBEGINS------------------------ --%> 
              <ol>
                   <li>Task</li>
                   <li>Task</li>
                   <li>Task</li>
               </ol>
             <%-- ----------------------Maria Alejandra Batista ENDS-------------------------- --%> 
         </div>
        </li>
          <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Keiron Carty</h4>
               <%-- ----------------------Keiron Carty BEGINS------------------------ --%>   
               <ol>
                   <li>Task</li>
                   <li>Task</li>
                   <li>Task</li>
               </ol>
               <%-- --------------------------Keiron Carty ENDS------------------------- --%>
         </div>
        </li>
          <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Beaudelaire Dussuau</h4>
             <%-- --------------------------Beaudelaire Dussuau BEGINS--------------------- --%>   
              <ol>
                   <li>Task</li>
                   <li>Task</li>
                   <li>Task</li>
               </ol>
             <%-- --------------------------Beaudelaire Dussuau ENDS----------------------- --%>   
         </div>
        </li>
         <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Otavio Vitali</h4>
             <%-- --------------------------Otavio Vitali BEGINS--------------------- --%>   
                <ol>
                   <li>Task</li>
                   <li>Task</li>
                   <li>Task</li>
               </ol>
             <%-- --------------------------Otavio Vitali ENDS----------------------- --%>   
         </div>
        </li>
          <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Jonathan H.</h4>
             <%-- --------------------------Jonathan H. BEGINS--------------------- --%>   
                <ol>
                   <li>Task</li>
                    <li>hello
                        <ol>
                           <li>Task</li>
                           <li>Task</li>
                           <li>Task</li>
                         </ol>
                    </li>
                   <li>Task</li>
                   <li>Task</li>
               </ol>
             <%-- --------------------------Jonathan H. ENDS----------------------- --%>   
         </div>
        </li>
    </ul>
</asp:Content>
