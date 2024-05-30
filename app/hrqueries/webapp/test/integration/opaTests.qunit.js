sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'hrqueries/test/integration/FirstJourney',
		'hrqueries/test/integration/pages/TicketList',
		'hrqueries/test/integration/pages/TicketObjectPage'
    ],
    function(JourneyRunner, opaJourney, TicketList, TicketObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('hrqueries') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTicketList: TicketList,
					onTheTicketObjectPage: TicketObjectPage
                }
            },
            opaJourney.run
        );
    }
);