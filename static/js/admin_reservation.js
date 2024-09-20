(function($) {
    $(document).ready(function() {
        function calculatePrice() {
            const startDate = $('#id_start_date_0').val() + ' ' + $('#id_start_date_1').val();
            const endDate = $('#id_end_date_0').val() + ' ' + $('#id_end_date_1').val();
            const numberOfTables = $('#id_number_of_tables').val();

            if (startDate && endDate && numberOfTables) {
                const tablePerHour = 50000;
                const start = new Date(startDate);
                const end = new Date(endDate);
                const duration = (end - start) / 3600000; 
                const price = (numberOfTables * duration) * tablePerHour;
                $('.field-price .readonly').text(Math.round(price));
            }
        }

        $('#id_start_date_0, #id_start_date_1, #id_end_date_0, #id_end_date_1, #id_number_of_tables').change(calculatePrice);
    });
})(django.jQuery);  


// ====================================================================================================
