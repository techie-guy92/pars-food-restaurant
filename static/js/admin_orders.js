(function($) {
    $(document).ready(function() {
        const totalAmountField = $(".field-total_amount .readonly");

        async function updateTotals() {
            const foodItems = $(".field-food select");
            const priceFields = $(".field-price p");
            const quantities = $(".field-quantity input");
            const grandTotalFields = $(".field-grand_total p");
            
            let totalAmount = 0;
            for (let index = 0; index < foodItems.length; index++) {
                const foodItem = foodItems[index];
                const quantity = quantities[index].value;
                const grandTotalField = grandTotalFields[index];
                const priceField = priceFields[index];
                
                console.log(`Processing item ${index}:`, foodItem, quantity, grandTotalField, priceField);
                
                if (foodItem.value && quantity) {
                    try {
                        const response = await fetch(`/get_food_price/${foodItem.value}/`);
                        const data = await response.json();
                        const price = data.price;
                        const grandTotal = price * quantity;
                        
                        if (grandTotalField) {
                            grandTotalField.textContent = grandTotal;
                        } else {
                            console.error(`Grand total field not found for item ${index}`);
                        }
                        
                        if (priceField) {
                            priceField.textContent = price;
                            console.log(`Price for item ${index} set to: ${price}`);
                        } else {
                            console.error(`Price field not found for item ${index}`);
                        }
                        
                        totalAmount += grandTotal;
                    } catch (error) {
                        console.error(`Error fetching price for item ${index}:`, error);
                    }
                } else {
                    console.warn(`Food item or quantity not set for item ${index}`);
                }
            }
            totalAmountField.text(totalAmount);
        }

        $(".inline-group").on("change", ".field-food select, .field-quantity input", updateTotals);
        $(".inline-group").on("input", ".field-quantity input", updateTotals);
    });
})(django.jQuery);


// ====================================================================================================