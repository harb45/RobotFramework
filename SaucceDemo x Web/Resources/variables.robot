*** Variables ***

# Data
${url}    https://www.saucedemo.com/
${browser}    Chrome
${standardUser}    standard_user
${locked}    locked_out_user
${password}    secret_sauce
${totalNumber}   2
@{totalPrice}

# Locators
${pageTitle}        //span[@class='title']
${userInput}        //input[@id='user-name']
${passwordInput}    //input[@id='password']
${listTri}         //select[@class="product_sort_container"]
${add}              //button[@class="btn btn_primary btn_small btn_inventory "]
${remove}           //button[@class="btn btn_secondary btn_small btn_inventory "]
${logoCard}       //span[@class="shopping_cart_badge"] 
${subLocator}         //div[@class="summary_subtotal_label"]
${taxLocator}       //div[@class="summary_tax_label"]
${totalLocator}     //div[@class="summary_total_label"]