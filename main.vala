void main()
{
	var dir = Dir.open(".");
	string? name;
	while ((name = dir.read_name()) != null)
	{
		if (name.has_suffix(".suprapack")) {
			var n = name[0:name.last_index_of_char('-')];
			DirUtils.create (n, 0755);
			Process.spawn_command_line_sync (@"tar -xvf '$name' -C '$n'");
			Process.spawn_command_line_sync (@"suprapack build '$n'");
			Process.spawn_command_line_sync (@"rm -rf '$n'");
			Process.spawn_command_line_sync (@"rm -rf '$name'");

			print ("%s, %s\n", n, name);
		}
	}


}
