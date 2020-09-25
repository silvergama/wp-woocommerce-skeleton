# wp-woocommerce-skeleton

## Overview
A basic Wordpress/Woocommerce skeleton store


### Instalation

```
git clone https://github.com/silvergama/wp-woocommerce-skeleton.git <store_name>
cd store_name
mv .env.sample .env
// configure .env with your data
make start
make translate (if it is a Brazilian store)
```

### Which plugins are instaled and activated?
- contact-form-7 
- woocommerce 
- woocommerce-pagseguro 
- woocommerce-extra-checkout-fields-for-brazil 
- woocommerce-correios 
- woo-correios-calculo-de-frete-na-pagina-do-produto

### Default theme
- storefront

### How to configure after started?
`docker exec worpdress wp ...`

e.g.: `docker exec wordpress wp plugin delete contact-form-7`
