/// 
Class User.movestable Extends %Persistent [ ClassType = persistent, DdlAllowed, Owner = {UnknownUser}, SqlRowIdPrivate, SqlTableName = moves_table ]
{

Property moves As %Library.String(MAXLEN = 10) [ SqlColumnNumber = 2 ];

Property comp As %Library.Boolean [ SqlColumnNumber = 3 ];

Storage Default
{
<Data name="movestableDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>moves</Value>
</Value>
<Value name="3">
<Value>comp</Value>
</Value>
</Data>
<DataLocation>^User.movestableD</DataLocation>
<DefaultData>movestableDefaultData</DefaultData>
<IdLocation>^User.movestableD</IdLocation>
<IndexLocation>^User.movestableI</IndexLocation>
<StreamLocation>^User.movestableS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

