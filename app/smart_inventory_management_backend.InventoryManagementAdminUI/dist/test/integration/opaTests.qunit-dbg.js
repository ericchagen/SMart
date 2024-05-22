sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'smartinventorymanagementbackend/InventoryManagementAdminUI/test/integration/FirstJourney',
		'smartinventorymanagementbackend/InventoryManagementAdminUI/test/integration/pages/StoreList',
		'smartinventorymanagementbackend/InventoryManagementAdminUI/test/integration/pages/StoreObjectPage'
    ],
    function(JourneyRunner, opaJourney, StoreList, StoreObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('smartinventorymanagementbackend/InventoryManagementAdminUI') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStoreList: StoreList,
					onTheStoreObjectPage: StoreObjectPage
                }
            },
            opaJourney.run
        );
    }
);