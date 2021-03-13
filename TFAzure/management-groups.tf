data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "tvaroot" {
  display_name = "TVA-Root"

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "production" {
  display_name               = "Production"
  parent_management_group_id = azurerm_management_group.example_parent.id

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}

resource "azurerm_management_group" "non-production" {
  display_name               = "Non-Production"
  parent_management_group_id = azurerm_management_group.example_parent.id

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}

resource "azurerm_management_group" "sandbox" {
  display_name               = "Sanbox"
  parent_management_group_id = azurerm_management_group.example_parent.id

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}