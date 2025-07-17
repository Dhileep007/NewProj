{#
    {%- set myname = 'dhileep' -%}
    {%- set age = 10 -%}
    my name is {{ myname }}, and my age is {{ age }}

    ----
    {%- set fruits =['a','b','c','d'] %}

    {% for i in range(3)%}
        fruit name is {{fruits[i]}} and index is {{i}} 
    {% endfor %}

    --
    {%- set fruits =['a','b','c','d'] %}

    {% for fruit in fruits%}
        fruit name is {{fruit}}
    {%endfor%}
#}


{%- set payment_methods = ['credit_card','cupon','bank_transfer','gift_card'] -%}

select 
    orderid, 
    {%-for payment_method in payment_methods%}
        SUM(CASE WHEN PAYMENTMETHOD = '{{payment_method}}' THEN Amount else 0 end) as {{payment_method}}_amount
        {%- if not loop.last -%} , {%-endif-%}
    {%-endfor%}
from raw.STRIPE.PAYMENT
GROUP BY 1