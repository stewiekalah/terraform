locals {
  nsg_rules = flatten([
    for key, rule in var.vnet_nsg_rules : [
      for subnet in inst.vols_list : {
        instance_uid = inst_key
        instance_id  = inst.instance_id
        volume_label = vol_key
      }
    ]
  ])

}