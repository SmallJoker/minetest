function unittests.test_settings()
	local k = "devtest_unittest_group"
	local conf = minetest.settings

	local seen = conf:get(k)
	if type(seen) == "userdata" then
		assert(seen:get("foobar") == "baz")
		assert(seen:get("post_edit") == "99")
	end

	local test = Settings()
	test:set("foobar", "baz")
	test:set("random", 1)
	test:set_bool("boolean", false)

	conf:set(k, test)
	test:set("post_edit", "99")

	assert(type(conf:get(k) == "userdata"))
end
