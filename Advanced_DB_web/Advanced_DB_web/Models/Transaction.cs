namespace Advanced_DB_web.Models
{
    public class Transaction
    {
        public string TransactionThirdPartyCompany { get; set; }
        public string TransactionSecurityQuestion { get; set; }
        public string TransactionAmount { get; set; }
        public string TransactionSecurityAnswer { get; set; }
        public string TransactionDateSent { get; set; }
        public string TransactionDateReceived { get; set; }
    }
}