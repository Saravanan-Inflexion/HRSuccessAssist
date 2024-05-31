sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageToast"
], function (Controller, MessageToast) {
    "use strict";

    return Controller.extend("hrqueries.controller.Dashboard", {
        onInit: function () {
            // Initialize the model with empty values for username and password
            var oModel = new sap.ui.model.json.JSONModel({
                username: "",
                password: ""
            });
            this.getView().setModel(oModel);
        },

        onTilePress: function () {
            // Navigate to TicketList page (Assuming you have a router configured)
            var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("TicketList");
        }
    });
});
