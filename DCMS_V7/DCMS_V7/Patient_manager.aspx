<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Patient_manager.aspx.cs" Inherits="DCMS_V7.Patient_manager" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" RenderMode="Lightweight" Width="100%">
    <TabPages>
        <dx:TabPage Text="Modify/Delete Patient">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GetAllpatients" KeyFieldName="ID" Width="100%">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                <EditButton Visible="True">
                                </EditButton>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FirstName" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LastName" ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhoneNumber" ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="EmailAddress" ShowInCustomizationForm="True" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Address" ShowInCustomizationForm="True" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Date of birth" FieldName="DoB" ShowInCustomizationForm="True" VisibleIndex="6">
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Settings ShowFilterRow="True" />
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="GetAllpatients" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" DeleteCommand="DELETE FROM [Patient] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Patient] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [Address], [DoB]) VALUES (@ID, @FirstName, @LastName, @PhoneNumber, @EmailAddress, @Address, @DoB)" SelectCommand="SELECT [ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [Address], [DoB] FROM [Patient] ORDER BY [FirstName], [LastName], [DoB]" UpdateCommand="UPDATE [Patient] SET [FirstName] = @FirstName, [LastName] = @LastName, [PhoneNumber] = @PhoneNumber, [EmailAddress] = @EmailAddress, [Address] = @Address, [DoB] = @DoB WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="EmailAddress" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter DbType="Date" Name="DoB" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="EmailAddress" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter DbType="Date" Name="DoB" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Delete Selected Patient" Width="197px">
                    </dx:ASPxButton>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="New Patient Form">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                        <Items>
                            <dx:LayoutItem Caption="First Name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Last Name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Phone Number">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Email">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Country">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E5" runat="server" DataSourceID="GetCountries" OnSelectedIndexChanged="ASPxFormLayout1_E5_SelectedIndexChanged" TextField="Name" ValueField="Name">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="GetCountries" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [Name] FROM [Country] ORDER BY [ID]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="City">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E6" runat="server" DataSourceID="GetCities" OnSelectedIndexChanged="ASPxFormLayout1_E6_SelectedIndexChanged" TextField="Name" ValueField="Name">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="GetCities" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [Name] FROM [City] WHERE ([CountryID] = @CountryID)">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="1" Name="CountryID" SessionField="C_ID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Address">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Day of Birth">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxCalendar ID="ASPxFormLayout1_E7" runat="server">
                                        </dx:ASPxCalendar>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxButton ID="ASPxFormLayout1_E8" runat="server" OnClick="ASPxFormLayout1_E8_Click" Text="Add Patient">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItems HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SettingsItemCaptions Location="Left" VerticalAlign="Middle" />
                    </dx:ASPxFormLayout>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>
&nbsp;
</asp:Content>