/// 
Class User.checktable Extends %Persistent [ ClassType = persistent, DdlAllowed, Owner = {UnknownUser}, SqlRowIdPrivate, SqlTableName = check_table ]
{

Property Row As %Library.String(MAXLEN = 1) [ SqlColumnNumber = 2 ];

Property Comp As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 3 ];

Property Player As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 4 ];

Property PKing As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 5 ];

Property CKing As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 6 ];

Storage Default
{
<Data name="checktableDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Row</Value>
</Value>
<Value name="3">
<Value>Comp</Value>
</Value>
<Value name="4">
<Value>Player</Value>
</Value>
<Value name="5">
<Value>PKing</Value>
</Value>
<Value name="6">
<Value>CKing</Value>
</Value>
</Data>
<DataLocation>^User.checktableD</DataLocation>
<DefaultData>checktableDefaultData</DefaultData>
<IdLocation>^User.checktableD</IdLocation>
<IndexLocation>^User.checktableI</IndexLocation>
<StreamLocation>^User.checktableS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

