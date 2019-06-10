### Available _jq methods_:

* [`channel_balance_status`](channel_balance_status.yaml):

  Gives a quick overview of all your online channel balance statuses.
  
  Good for spotting targets for rebalancing tools like https://github.com/lightningd/plugins/tree/master/rebalance.
  
  
* [`paymentstats`](paymentstats.yaml):

  Lists detailed payment stats (count complete and failed, sum of paid and fees and percent).
  
  
* [`simplefunds`](simplefunds.yaml):

  Shows a quick overview of total funds, both in channels and in unspent transaction outputs.
  
  Mimics the functionality of renepickhardt's [`funds`](https://github.com/renepickhardt/c-lightning-plugin-collection/tree/master/simpleFundsOverview) Python plugin.
  
  
