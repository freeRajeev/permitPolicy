package permit.custom

default allow := false

# You can find the official Rego tutorial at:
# https://www.openpolicyagent.org/docs/latest/policy-language/
# Example rule - you can replace this with something of your own
# allow {
# 	input.user.key == "test@permit.io"
# }
# Also, you can add more allow blocks here to get an OR effect
# allow {
#     # i.e if you add my_custom_rule here - the policy will allow
#     # if my_custom_rule is true, EVEN IF policies.allow is false.
#     my_custom_rule
# }
import (
  "github.com/okta/okta-sdk-golang/okta"
  "github.com/dgrijalva/jwt-go"
  "github.com/Permit-It/permit"
)

// Define your entities
type User struct {
  ID    string
  Email string
}

type Resource struct {
  ID   string
  Name string
}

// Define your policies
func myPolicyFunction(user permit.User, resource permit.Resource) bool {
  // Check if the user has a relationship with the resource based on some criteria
  if user.Email == "admin@example.com" {
    return true
  } else if user.Email == "user@example.com" && resource.Name == "My Resource" {
    return true
  }
  return false
}

// Implement your policies
func main() {
  // Create a Permit-It instance
  p := permit.New()

  // Register your entities
  p.RegisterEntity(User{})
  p.RegisterEntity(Resource{})

  // Register your policies
  p.RegisterPolicyFunction("myPolicyFunction", myPolicyFunction)

  // Use Permit-It to enforce your policies
  user := User{ID: "123", Email: "user@example.com"}
  resource := Resource{ID: "456", Name: "My Resource"}
  if p.Check(user, "myPolicyFunction", resource) {
    // Grant access
  } else {
    // Deny access
  }
}
