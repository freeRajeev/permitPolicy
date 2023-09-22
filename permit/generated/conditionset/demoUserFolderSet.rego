package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_demoUserFolderSet = false

userset_demoUserFolderSet {
	attributes.user.roles == "123"
}
