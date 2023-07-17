enum VerifiedIdStatus {
  not_uploaded,
  pending,
  approved,
  rejected,
}



enum TransfersStatus {
  pending,
  completed,
  sent,
  rejected,
  canceled,
  ready,
}


enum TransactionsList {
  service,
  invoice,
  withdraw,
}


enum InvoiceItemStatus {
  pending_verification,
  pending_approval,
  pending_payment,
  sent,
  paid,
  archived,
  rejected,
  cancelled,
  refunded,
  unpaid,
}



final List<Map<String, String>> InvoiceStatus = [
  {'pending_verification': "Pending Verification", "color": "0xFFDAA545"},
  {'pending_approval': "Pending Approval", "color": "0xFFDAA545"},
  {'pending_payment': "Pending Payment", "color": "0xFFDAA545"},
  {'sent': "Sent", "color": "0xFF0044FF"},
  {'paid': "Paid", "color": "0xFF4FB044"},
  {'archived': "Archived", "color": "0xFF8C8C8C"},
  {'rejected': "Rejected", "color": "0xFFE90B0B"},
  {'cancelled': "Cancelled", "color": "0xFFE90B0B"},
  {'refunded': "Refunded", "color": "0xFF000000"}, // not found
  {'unpaid': "Unpaid", "color": "0xFF6C6969"},
];

