$(window).ready(function () {
    
    // Loading everything in this function only when the window is ready.

    loadScript(plugin_path + 'jquery/jquery-ui.min.js', function () { /** jQuery UI **/
        loadScript(plugin_path + 'jquery/jquery.ui.touch-punch.min.js', function () { /** Mobile Touch Slider **/
            loadScript(plugin_path + 'form.slidebar/jquery-ui-slider-pips.min.js', function () { /** Slider Script **/

                // Injecting values to radio buttons Job Quality.
                $("#jobQualityStandard").val(enumJobQuality.Standard);
                $("#jobQualityPremium").val(enumJobQuality.Premium);
                $("#jobQualityExcelium").val(enumJobQuality.Excelium);


                // Triggering the change event onClick for the stepper arrow buttons.
                $(".stepper-btn-wrap").click(function () {
                    $(this).parent().find(".stepper").delay(50).change();
                });

    /** SLIDERS **/

            /** Slider 10 **/
                $(".sliderNumber10").slider({
                    value: 0,
                    animate: true,
                    min: 0,
                    max: 10,
                    step: 1,
                    range: "min",
                    slide: function (event, ui) {
                        $(this).closest(".row").find(".sliderValue10").val(ui.value).change();
                    }
                });

                $(".sliderNumber10").each(function () {
                    $(this).closest(".row").find(".sliderValue10").val($(this).slider("value"));

                });

                $(".sliderValue10").change(function () {
                    $(this).closest(".row").find(".sliderNumber10").slider("value", $(this).val());
                });

            /** Slider 50 **/
                $(".sliderNumber50").slider({
                    value: 0,
                    animate: true,
                    min: 0,
                    max: 50,
                    step: 1,
                    range: "min",
                    slide: function (event, ui) {
                        $(this).closest(".row").find(".sliderValue50").val(ui.value).change();
                    }
                });

                

                $(".sliderNumber50").each(function (index) {
                    $(this).closest(".row").find(".sliderValue50").val($(this).slider("value"));

                });

                $(".sliderValue50").change(function () {
                    $(this).closest(".row").find(".sliderNumber50").slider("value", $(this).val());
                });

            /** Slider 200 **/
                $(".sliderNumber200").slider({
                    value: 0,
                    animate: true,
                    min: 0,
                    max: 200,
                    step: 1,
                    range: "min",
                    slide: function (event, ui) {
                        $(this).closest(".row").find(".sliderNumber200").val(ui.value).change();
                    }
                });

                $(".sliderNumber200").each(function (index) {
                    $(this).closest(".row").find(".sliderNumber200").val($(this).slider("value"));

                });

                $(".sliderNumber200").change(function () {
                    $(this).closest(".row").find(".sliderNumber200").slider("value", $(this).val());
                });

            /** Slider 20 **/
                $(".sliderNumber20").slider({
                    value: 0,
                    animate: true,
                    min: 0,
                    max: 20,
                    step: 1,
                    range: "min",
                    slide: function (event, ui) {
                        $(this).closest(".row").find(".sliderNumber20").val(ui.value).change();
                    }
                });

                $(".sliderNumber20").each(function (index) {
                    $(this).closest(".row").find(".sliderNumber20").val($(this).slider("value"));

                });

                $(".sliderNumber20").change(function () {
                    $(this).closest(".row").find(".sliderNumber20").slider("value", $(this).val());
                });

            /** Slider 24 **/
                $(".sliderNumber24").slider({
                    value: 0,
                    animate: true,
                    min: 0,
                    max: 24,
                    step: 1,
                    range: "min",
                    slide: function (event, ui) {
                        $(this).closest(".row").find(".sliderNumber24").val(ui.value).change();
                    }
                });

                $(".sliderNumber24").each(function (index) {
                    $(this).closest(".row").find(".sliderNumber24").val($(this).slider("value"));

                });

                $(".sliderNumber24").change(function () {
                    $(this).closest(".row").find(".sliderNumber24").slider("value", $(this).val());
                });

            /** Slider 500 **/
                $(".sliderNumber500").slider({
                    value: 0,
                    animate: true,
                    min: 0,
                    max: 500,
                    step: 1,
                    range: "min",
                    slide: function (event, ui) {
                        $(this).closest(".row").find(".sliderNumber500").val(ui.value).change();
                    }
                });

                $(".sliderNumber500").each(function (index) {
                    $(this).closest(".row").find(".sliderNumber500").val($(this).slider("value"));

                });

                $(".sliderNumber500").change(function () {
                    $(this).closest(".row").find(".sliderNumber500").slider("value", $(this).val());
                });


                //On load
                loadElementsInTab("tabResidential");
            });
        });
    });


    // Implementing the calculateQuote() function with a class (prevent repetitive IDS) inside a change event function
    $(".calculateQuoteOnChange").change(function () {
        calculateQuote();
    });
}); 
// End of document ready



/*
    Here we load the appropriate elements in the selected tab, we get the elements in the previously selected tab and move it to the parent container
    and then we get the form elements for the selected tabs to move it in the dom.

    <param name="selectedTab">ID of tab-pane in the section quoteformSection [tabResidential,tabCommercial,tabCorporate,tabHybrid]</param>
*/

function loadElementsInTab(selectedTab) {
    if (currentTab != null) {
        $("#" + currentTab + " .card-block>.row").detach().appendTo("#formElementsToInjectInTabs");
    }

    switch (selectedTab) {
        case "tabResidential":
            $("#errorContainer").closest(".row").detach().appendTo("#tabResidential .card-block");
            $("#numberOfApartments").closest(".row").detach().appendTo("#tabResidential .card-block");
            $("#numberOfFloors").closest(".row").detach().appendTo("#tabResidential .card-block");
            $("#numberOfBasements").closest(".row").detach().appendTo("#tabResidential .card-block");
            $("#jobQualityStandard").closest(".row").detach().appendTo("#tabResidential .card-block");
            $("#totalNumberOfElevators").closest(".row").detach().appendTo("#tabResidential .card-block"); 
            $("#submitform").closest(".row").detach().appendTo("#tabResidential .card-block"); 
            break;
        case "tabCommercial":
            $("#errorContainer").closest(".row").detach().appendTo("#tabCommercial .card-block");
            $("#numberOfBusinesses").closest("row").detach().appendTo("#tabCommercial .card-block");
            $("#numberOfFloors").closest(".row").detach().appendTo("#tabCommercial .card-block");
            $("#numberOfBasements").closest(".row").detach().appendTo("#tabCommercial .card-block");
            $("#numberOfParking").closest(".row").detach().appendTo("#tabCommercial .card-block");
            $("#numberOfElevatorsDesired").closest(".row").detach().appendTo("#tabCommercial .card-block");
            $("#jobQualityStandard").closest(".row").detach().appendTo("#tabCommercial .card-block");
            $("#totalNumberOfElevators").closest(".row").detach().appendTo("#tabCommercial .card-block");
            $("#submitform").closest(".row").detach().appendTo("#tabCommercial .card-block");
            break;
        case "tabCorporate":
            $("#errorContainer").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#numberOfTenantCompanies").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#numberOfFloors").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#numberOfBasements").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#numberOfParking").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#numberOfOccupants").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#jobQualityStandard").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#totalNumberOfElevators").closest(".row").detach().appendTo("#tabCorporate .card-block");
            $("#submitform").closest(".row").detach().appendTo("#tabCorporate .card-block");
            break;
        case "tabHybrid":
            $("#errorContainer").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#numberOfBusinesses").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#numberOfFloors").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#numberOfBasements").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#numberOfParking").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#numberOfOccupants").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#numberOfHoursOfActivity").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#jobQualityStandard").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#totalNumberOfElevators").closest(".row").detach().appendTo("#tabHybrid .card-block");
            $("#submitform").closest(".row").detach().appendTo("#tabHybrid .card-block");
            break;
        default:
    }

    currentTab = selectedTab;
}

//Declaring our constants to be used in the calculations to avoid magic numbers as much as possible.
const settings = {
    OneElevatorEachXApartement: 6,
    OneElevatorEachXOccupants: 1000,
    OneElevatorEachXFloors: 20,
};

const price = {
    Standard: {
        Unit: 7565,
        Fees: 0.10
    },
    Premium: {
        Unit: 12345,
        Fees: 0.13
    },
    Excelium: {
        Unit: 15400,
        Fees: 0.16
    }
};

const enumJobQuality = {
    Standard: 0,
    Premium: 1,
    Excelium: 2
};


// Declaring the global variables to prevent loading all the variables since some are only specific to certain tabs. This will reduce loading on the website.
// var errorValidation = [];
var currentTab = null;


// Calculating stuff
function calculateQuote() {
    errorValidation = [];
    var numberOfFloors = $("#numberOfFloors").val();
    var numberOfBasements = $("#numberOfBasements").val();

    // Making a switch to prevent the repetitive use of many if statements. Pushing the results of the calculations as a parameter in updateUIEstimatedResults().
    switch (currentTab) {
        case "tabResidential":
            var numberOfApartments = $("#numberOfApartments").val();

            var columns = Math.ceil(numberOfFloors / settings.OneElevatorEachXFloors);
            var averageOfDoorsPerFloor = Math.ceil(numberOfApartments / numberOfFloors);
            var elevators = Math.ceil((averageOfDoorsPerFloor / settings.OneElevatorEachXApartement) * columns);

            // Standard
            if ($('#jobQualityStandard').is(':checked')) {
                var subTotal = (price.Standard.Unit * elevators);
                var installationFees = price.Standard.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Premium
            if ($('#jobQualityPremium').is(':checked')) {
                var subTotal = price.Premium.Unit * elevators;
                var installationFees = price.Premium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Excelium
            if ($('#jobQualityExcelium').is(':checked')) {
                var subTotal = price.Excelium.Unit * elevators;
                var installationFees = price.Excelium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            updateUIEstimatedResults(elevators, subTotal, installationFees, totalPrice);
            break;
        case "tabCommercial":
            var numberOfParking = $("#numberOfParking").val();
            var elevators = $("#numberOfElevatorsDesired").val();

            // Standard
            if ($('#jobQualityStandard').is(':checked')) {
                var subTotal = price.Standard.Unit * elevators;
                var installationFees = price.Standard.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Premium
            if ($('#jobQualityPremium').is(':checked')) {
                var subTotal = price.Premium.Unit * elevators;
                var installationFees = price.Premium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Excelium
            if ($('#jobQualityExcelium').is(':checked')) {
                var subTotal = price.Excelium.Unit * elevators;
                var installationFees = price.Excelium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }
            updateUIEstimatedResults(elevators, subTotal, installationFees, totalPrice);
            break;
        case "tabCorporate":
            var numberOfParking = $("#numberOfParking").val();
            var numberOfOccupants = $("#numberOfOccupants").val();
            var numberOfTenantCompanies = $("#numberOfTenantCompanies").val();

            var stories = Math.ceil(parseInt(numberOfFloors) + parseInt(numberOfBasements));
            var columns = Math.ceil(stories / settings.OneElevatorEachXFloors);
            var totalOccupants = Math.ceil(numberOfOccupants * stories);
            var elevators = Math.ceil(totalOccupants / settings.OneElevatorEachXOccupants);
            var elevatorsPerColumns = Math.ceil(elevators / columns);
            var totalElevators = Math.ceil(columns * elevatorsPerColumns);

            // Standard
            if ($('#jobQualityStandard').is(':checked')) {
                var subTotal = price.Standard.Unit * totalElevators;
                var installationFees = price.Standard.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Premium
            if ($('#jobQualityPremium').is(':checked')) {
                var subTotal = price.Premium.Unit * totalElevators;
                var installationFees = price.Premium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Excelium
            if ($('#jobQualityExcelium').is(':checked')) {
                var subTotal = price.Excelium.Unit * totalElevators;
                var installationFees = price.Excelium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            updateUIEstimatedResults(totalElevators, subTotal, installationFees, totalPrice);
            break;
        case "tabHybrid":
            var numberOfParking = $("#numberOfParking").val();
            var numberOfOccupants = $("#numberOfOccupants").val();
            var numberOfHoursOfActivity = $("#numberOfHoursOfActivity").val();
            var numberOfTenantCompanies = $("#numberOfTenantCompanies").val();

            var stories = Math.ceil(parseInt(numberOfFloors) + parseInt(numberOfBasements));
            var columns = Math.ceil(stories / settings.OneElevatorEachXFloors);
            var totalOccupants = Math.ceil(numberOfOccupants * stories);
            var elevators = Math.ceil(totalOccupants / settings.OneElevatorEachXOccupants);
            var elevatorsPerColumns = Math.ceil(elevators / columns);
            var totalElevators = Math.ceil(columns * elevatorsPerColumns);

            // Standard
            if ($('#jobQualityStandard').is(':checked')) {
                var subTotal = price.Standard.Unit * totalElevators;
                var installationFees = price.Standard.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Premium
            if ($('#jobQualityPremium').is(':checked')) {
                var subTotal = price.Premium.Unit * totalElevators;
                var installationFees = price.Premium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            // Excelium
            if ($('#jobQualityExcelium').is(':checked')) {
                var subTotal = price.Excelium.Unit * totalElevators;
                var installationFees = price.Excelium.Fees * subTotal;
                var totalPrice = subTotal + installationFees;
            }

            updateUIEstimatedResults(totalElevators, subTotal, installationFees, totalPrice);
            break;
        default:
    }
}

/*
    This is where we update the estimated results for the user's submission for the 4 results and we use the "html" event with the parameter names so
    that when we just call the function, we simply input it in the appropriate order to update each result everytime there's a change since we loaded
    the calculateQuote() functon (which transforms inputs in variables) in a change event function.
*/

function updateUIEstimatedResults(elevators, subTotal, installationFees, totalPrice) {
    $("#totalNumberOfElevators").html(Math.ceil((elevators) || 0));
    $("#subTotal").html(roundPrice(subTotal));
    $("#installationFees").html(roundPrice(installationFees));
    $("#totalPrice").html(roundPrice(totalPrice));

    $("#totalNumberOfElevators").parent().find("input[type='hidden']").val(Math.ceil((elevators) || 0));
    $("#subTotal").parent().parent().find("input[type='hidden']").val(roundPrice(subTotal));
    $("#installationFees").parent().parent().find("input[type='hidden']").val(roundPrice(installationFees));
    $("#totalPrice").parent().parent().find("input[type='hidden']").val(roundPrice(totalPrice));

    $("#subTotal").formatCurrency();
    $("#installationFees").formatCurrency();
    $("#totalPrice").formatCurrency();
    }

/*
    This is a round function I found on google and imported. I simply removed the "digits" parameter since it'll always be 2 digits for me.

    Link : https://stackoverflow.com/questions/15762768/javascript-math-round-to-two-decimal-places
*/


function roundPrice(number) {
    
    if (!$.isNumeric(number)) {
        number = "0";
    }
    number = parseFloat(number);
    var negative = false;

    if (number < 0) {
        negative = true;

        number = number * -1;
    }
    var multiplicator = Math.pow(10, 2);
    number = parseFloat((number * multiplicator).toFixed(11));
    number = (Math.round(number) / multiplicator).toFixed(2);
    if (negative) {
        number = (number * -1).toFixed(2);
    }
    return number;
}

