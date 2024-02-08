import 'package:args/command_runner.dart';

final class CreateCommand extends Command {
  final String _nameCommand;
  final String _descriptionCommand;
  final List<Command> _commands;
  final Function? _runCommand;
  final ({String name, String help, String abbr})? _args;

  CreateCommand({
    required nameCommand,
    required String descriptionCommand,
    Function? runCommand,
    List<Command>? commands,
    ({String name, String help, String abbr})? args,
  })  : _nameCommand = nameCommand,
        _descriptionCommand = descriptionCommand,
        _commands = commands ?? [],
        _runCommand = runCommand,
        _args = args {
    if (_commands.isNotEmpty) {
      for (Command command in _commands) {
        addSubcommand(command);
      }
    }
    if (_args != null) {
      argParser.addOption(
        _args!.name,
        help: _args!.help,
        abbr: _args!.abbr,
      );
    }
  }

  @override
  String get description => _descriptionCommand;

  @override
  String get name => _nameCommand;

  @override
  void run() {
    if (_runCommand != null) {
      if (_args != null) {
        _runCommand!(argResults?[_args!.name]);
      } else {
        _runCommand!();
      }
      return;
    } else {
      return;
    }
  }
}
