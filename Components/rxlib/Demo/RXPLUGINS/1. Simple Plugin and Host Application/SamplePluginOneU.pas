unit SamplePluginOneU;



















      APluginMessage: Integer; AMessageText: String);























begin
   ShowMessage('Command One clicked');
end;

procedure TSampleUILPlugin.uilPlugin1Commands1Execute(Sender: TObject);
begin
   ShowMessage('Command Two clicked');
end;

procedure TSampleUILPlugin.uilPlugin1Commands2Execute(Sender: TObject);
begin
   ShowMessage('Command Three clicked');
end;

procedure TSampleUILPlugin.uilPlugin1PluginMessage(Sender: TObject;
  APluginMessage: Integer; AMessageText: String);
begin
   ShowMessage(Format('Plugin Message number %d received. MessageText: %s', [APluginMessage, AMessageText]));
end;

procedure TSampleUILPlugin.uilPlugin1Configure(Sender: TObject);
begin
   ShowMessage('You could put a configuration dialog here, if your plugin requires one.');
end;

end.