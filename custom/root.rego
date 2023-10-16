package permit.custom

import data.permit.custom
import data.permit.debug
import data.permit.policies
import future.keywords.in
import data.permit.generated.abac.utils.attributes
import input.attributes.request.http as http_request
parsed_path := split_path(http_request.path)

default allow := false
allow {
    print("....calling decode JWT")

}

JwtDecode = {"userID": userID, "role": role} {
    [_, jwt_token] := split(http_request.headers.authorization, " ")
    io.jwt.decode(jwt_token, [_, payload, _])
    userID := payload.userID
    role := payload.role
}

parsed_path := split_path(http_request.path)

split_path(str) = parts {
    trimmed := trim(str, "/")
    parts := split(trimmed, "/")
}


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
