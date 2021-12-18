# ecomm_app

A simple ecommerce app built with Flutter for Android and iOS.


<img src="https://user-images.githubusercontent.com/71610086/146559897-d51b8933-d009-401b-85aa-b932eb19b78d.gif"  width="250" height="400" >


To use Mercadopago it is necessary to have the credentials. Create an .env in the root of the project.

https://www.mercadopago.com.ar/developers/es/guides/online-payments/checkout-pro/previous-requirements

Code .env file:

 ```
 //IMPORTANT do not change the name of the variables 
 
 # Sandbox
MPTEST_PUBLICKEY="{YOUR_TEST_PUBLICKEY}"
MPTEST_ACCESSTOKEN="{YOUR_TEST_ACCESSTOKEN}"


# Production
MP_PUBLICKEY="{YOUR_PUBLICKEY}"
MP_ACCESSTOKEN="{YOUR_ACCESSTOKEN}"

MP_CLIENT_ID="{YOUR_CLIENT_ID}"
MP_CLIENT_SECRET="{YOUR_CLIENT_SECRET}"
```

