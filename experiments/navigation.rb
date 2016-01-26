ab_test "navigation" do
	description "Which navigation converts better, top or left"
	alternatives "leftnav", "topnav"
	metrics :signups
end