<tr class="order-detail">
    <td colspan="9">
        <?php echo $this->renderPartial('_order_detail_nav',array('order_id'=>$order_id),true);?>

        <div class="hero-unit info" style="margin-bottom: 10px;padding: 3px;">
        <?php echo $this->renderPartial(
            '_order_base',
            array(
                'order_id'=>$order_id,
                'order_info'=>$order_info,
                'payment_info'=>$payment_info,
                'user_name'=>$user_name,
                'user_info'=>$user_info,
                'user_info_addon'=>$user_info_addon,
                'product_list'=>$product_list,
            ),
            true);
        ?>
        </div>
    </td>
</tr>