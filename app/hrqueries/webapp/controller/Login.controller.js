sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageToast"
], function (Controller, MessageToast) {
    "use strict";

    return Controller.extend("hrqueries.controller.Login", {
        onInit: function () {
            // Initialize the model with empty values for username and password
            var oModel = new sap.ui.model.json.JSONModel({
                username: "",
                password: ""
            });
            this.getView().setModel(oModel);
        },

        onSignInPress: function () {
            var oView = this.getView();
            var sUsername = oView.byId("usernameInput").getValue();
            var sPassword = oView.byId("passwordInput").getValue();

            // Perform login validation here (this is just a placeholder example)
            if (sUsername && sPassword) {
                // Simulate successful login
                MessageToast.show("Login successful!");

                // Navigate to Dashboard page (Assuming you have a router configured)
                var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
                oRouter.navTo("Dashboard");
            } else {
                MessageToast.show("Please enter a username and password.");
            }
        }
    });
});
