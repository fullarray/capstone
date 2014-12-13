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
                   <li>Colaborated with written documentation</li>
                   <li>Colaborated with group proposal and milestone</li>
                   <li>Created final presentation</li>
                   <li>Created non-code prototypes of application</li>
               </ol>
             <%-- ----------------------Maria Alejandra Batista ENDS-------------------------- --%> 
         </div>
        </li>
          <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Keiron Carty</h4>
               <%-- ----------------------Keiron Carty BEGINS------------------------ --%>   
               <ol>
                   <li>Enabled Activate and Deactivate Questions</li>
                   <li>Created Deactivate Sub implementation</li>
                   <li>Colaborated with group proposal and milestone</li>
               </ol>
               <%-- --------------------------Keiron Carty ENDS------------------------- --%>
         </div>
        </li>
          <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Beaudelaire Dussuau</h4>
             <%-- --------------------------Beaudelaire Dussuau BEGINS--------------------- --%>   
              <ol>
                   <li>Combine questions</li>
                   <li>Enable Coral Spring radio Button</li>
                   <li>Colaborated with group proposal and milestone</li>
               </ol>
             <%-- --------------------------Beaudelaire Dussuau ENDS----------------------- --%>   
         </div>
        </li>
         <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Otavio Vitali</h4>
             <%-- --------------------------Otavio Vitali BEGINS--------------------- --%>   
                <ol>
                   <li>Wrote all paper documentation</li>
                   <li>Changed survey question radio buttons to drop lists</li>
                   <li>Colaborated with group proposal and milestone</li>
               </ol>
             <%-- --------------------------Otavio Vitali ENDS----------------------- --%>   
         </div>
        </li>
          <li class="media">
         <div class="media-body">
            <h4 class="media-heading">Jonathan H.</h4>
             <%-- --------------------------Jonathan H. BEGINS--------------------- --%>   
                <ol>
                   <li>Designed application prototype in code</li>
                    <li>Coded main and subnavigation menus
                        <ol>
                           <li>Cleaned, organized, and designed menu functionalities in code</li>
                           <li>Linked pages to menus</li>
                           <li>Made the menu responsive</li>
                         </ol>
                    </li>
                   <li>Consolidated pages and made questions display in one page.</li>
                   <li>Created coherent user interface(UI)</li>
                   <li>Created coherent user experience(UX)</li>
                   <li>Refactor VB code in defaults.aspx.vb so Coral Springs work</li>
                   <li>Deleted unnecessary files and pages</li>
                   <li>Clean or complete code inconsistencies and unclosed tags</li>
                   <li>Reorganized the project folders and pages</li>
                    <li>Placed the survey in one directory</li>
                    <li>Enabled accounts, registration, and user administration</li>
                    <li>Restricted survey area to authenticated users only</li>
                    <li>Made the entire application responsive</li>
                     <li>Colaborated with group proposal and milestone</li>
                    <li>Colaborated with written documentation</li>
               </ol>
             <%-- --------------------------Jonathan H. ENDS----------------------- --%>   
         </div>
        </li>
    </ul>
</asp:Content>
