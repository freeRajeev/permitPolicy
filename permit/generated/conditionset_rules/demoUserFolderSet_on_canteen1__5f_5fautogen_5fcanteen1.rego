package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default demoUserFolderSet_5fon_5fcanteen1_5f_5f5f_5f5fautogen_5f5fcanteen1 = false

demoUserFolderSet_5fon_5fcanteen1_5f_5f5f_5f5fautogen_5f5fcanteen1 {
	conditionset.userset_demoUserFolderSet
	conditionset.resourceset__5f_5fautogen_5fcanteen1
	input.action in condition_set_permissions.demoUserFolderSet.__autogen_canteen1[input.resource.type]
}
