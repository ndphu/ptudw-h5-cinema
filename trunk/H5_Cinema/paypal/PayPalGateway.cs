using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


using H5_Cinema.com.paypal.sandbox.www;

public class PayPalGateway
{
    public PayPalGateway()
    {
    }

    public PayPalReturn Pay(string orderNumber, string paymentAmount, string buyerLastName, string buyerFirstName, string buyerAddress, string buyerCity, string buyerStateOrProvince, string buyerCountryCode, string buyerCountryName, string buyerZipCode, string creditCardType, string creditCardNumber, string CVV2, string expMonth, string expYear)
    {
        //PayPal Return Structure
        PayPalReturn rv = new PayPalReturn();
        rv.IsSucess = false;
        
        DoDirectPaymentRequestDetailsType requestDetails = new DoDirectPaymentRequestDetailsType();
        requestDetails.CreditCard = new CreditCardDetailsType();
        requestDetails.CreditCard.CardOwner = new PayerInfoType();
        requestDetails.CreditCard.CardOwner.Address = new AddressType();
        requestDetails.PaymentDetails = new PaymentDetailsType();
        requestDetails.PaymentDetails.OrderTotal = new BasicAmountType();
        requestDetails.CreditCard.CardOwner.PayerName = new PersonNameType();

        //Request
        requestDetails.PaymentAction = PaymentActionCodeType.Sale;
        requestDetails.IPAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

        //Payment
        requestDetails.PaymentDetails.OrderTotal.currencyID = CurrencyCodeType.USD;
        requestDetails.PaymentDetails.OrderTotal.Value = paymentAmount;

        //Credit card
        requestDetails.CreditCard.CreditCardNumber = creditCardNumber;
        requestDetails.CreditCard.CreditCardType = (CreditCardTypeType)Enum.Parse(typeof(CreditCardTypeType), creditCardType, true);
        requestDetails.CreditCard.ExpMonth = Convert.ToInt32(expMonth);
        requestDetails.CreditCard.ExpYear = Convert.ToInt32(expYear);
        requestDetails.CreditCard.CVV2 = CVV2;
        requestDetails.CreditCard.CreditCardTypeSpecified = true;
        requestDetails.CreditCard.ExpMonthSpecified = true;
        requestDetails.CreditCard.ExpYearSpecified = true;

        //Card Owner
        requestDetails.CreditCard.CardOwner.PayerName.FirstName = buyerFirstName;
        requestDetails.CreditCard.CardOwner.PayerName.LastName = buyerLastName;
        requestDetails.CreditCard.CardOwner.Address.Street1 = buyerAddress;
        requestDetails.CreditCard.CardOwner.Address.CityName = buyerCity;
        requestDetails.CreditCard.CardOwner.Address.StateOrProvince = buyerStateOrProvince;
        requestDetails.CreditCard.CardOwner.Address.CountryName = buyerCountryName;
        requestDetails.CreditCard.CardOwner.Address.Country = (CountryCodeType)Enum.Parse(typeof(CountryCodeType), buyerCountryCode, true);
        requestDetails.CreditCard.CardOwner.Address.PostalCode = buyerZipCode;
        requestDetails.CreditCard.CardOwner.Address.CountrySpecified = true;
        requestDetails.CreditCard.CardOwner.PayerCountry = (CountryCodeType)Enum.Parse(typeof(CountryCodeType), buyerCountryCode, true);
        requestDetails.CreditCard.CardOwner.PayerCountrySpecified = true;

        DoDirectPaymentReq request = new DoDirectPaymentReq();
        request.DoDirectPaymentRequest = new DoDirectPaymentRequestType();
        request.DoDirectPaymentRequest.DoDirectPaymentRequestDetails = requestDetails;
        request.DoDirectPaymentRequest.Version = "51.0";

        //Headers
        CustomSecurityHeaderType headers = new CustomSecurityHeaderType();
        headers.Credentials = new UserIdPasswordType();
        headers.Credentials.Username = ConfigurationManager.AppSettings["PayPalAPIUsername"];
        headers.Credentials.Password = ConfigurationManager.AppSettings["PayPalAPIPassword"];
        headers.Credentials.Signature = ConfigurationManager.AppSettings["PayPalAPISignature"];

        //Client
        PayPalAPIAASoapBinding client = new PayPalAPIAASoapBinding();
        client.RequesterCredentials = headers;
        client.Timeout = 15000;
        DoDirectPaymentResponseType response = client.DoDirectPayment(request);
        if (response.Ack == AckCodeType.Success || response.Ack == AckCodeType.SuccessWithWarning)
        {
            rv.IsSucess = true;
            rv.TransactionID = response.TransactionID;
        }
        else
        {
            rv.ErrorMessage = response.Errors[0].LongMessage;
        }
        return rv;
    }

    public PayPalReturn GetTransactionDetails(string transactionID)
    {
        //PayPal Return Structure
        PayPalReturn rv = new PayPalReturn();
        rv.IsSucess = false;

        //Requests
        //TransactionID = "6XT85330WL909250J"
        GetTransactionDetailsReq request = new GetTransactionDetailsReq();
        request.GetTransactionDetailsRequest = new GetTransactionDetailsRequestType();
        request.GetTransactionDetailsRequest.TransactionID = transactionID;
        request.GetTransactionDetailsRequest.Version = "51.0";

        //Headers
        CustomSecurityHeaderType headers = new CustomSecurityHeaderType();
        headers.Credentials = new UserIdPasswordType();
        headers.Credentials.Username = ConfigurationManager.AppSettings["PayPalAPIUsername"];
        headers.Credentials.Password = ConfigurationManager.AppSettings["PayPalAPIPassword"];
        headers.Credentials.Signature = ConfigurationManager.AppSettings["PayPalAPISignature"];

        //Client
        PayPalAPISoapBinding client = new PayPalAPISoapBinding();
        client.RequesterCredentials = headers;
        client.Timeout = 15000;
        GetTransactionDetailsResponseType response = client.GetTransactionDetails(request);
                
        if (response.Ack == AckCodeType.Success || response.Ack == AckCodeType.SuccessWithWarning)
        {
            rv.IsSucess = true;
            rv.TransactionID = response.PaymentTransactionDetails.PaymentInfo.TransactionID;
            rv.ObjectValue = response.PaymentTransactionDetails;
        }
        else
        {
            rv.ErrorMessage = response.Errors[0].LongMessage;
        }
        return rv;
    }
}
