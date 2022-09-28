import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CheckoutComponent } from './checkout/checkout.component';
import { FailedPaymentComponent } from './failed-payment/failed-payment.component';
import { OrderComponent } from './order/order.component';

const routes: Routes = [
  { path: '',  component: CheckoutComponent },
  { path: 'payment-failed',  component: FailedPaymentComponent },
  { path: 'order/:order_id',  component: OrderComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CheckoutRoutingModule { }
