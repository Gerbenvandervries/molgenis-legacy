package org.molgenis.fieldtypes;

import org.molgenis.framework.db.Database;
import org.molgenis.framework.ui.html.HtmlInput;
import org.molgenis.model.MolgenisModelException;

/**
 * This type is used when the field type is not known.
 * For example if(MolgenisFieldType.getType(name) instanceof UnknownType( {//handle this bad situation 
 */
public class UnknownField extends FieldType
{

	@Override
	public String getFormatString()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getHsqlType() throws MolgenisModelException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getJavaAssignment(String value) throws MolgenisModelException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getJavaPropertyDefault() throws MolgenisModelException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getJavaPropertyType() throws MolgenisModelException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getMysqlType() throws MolgenisModelException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getXsdType() throws MolgenisModelException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HtmlInput createInput(String name, String xrefEntityClassName,
			Database db) throws InstantiationException, IllegalAccessException
	{
		// TODO Auto-generated method stub
		return null;
	}

}