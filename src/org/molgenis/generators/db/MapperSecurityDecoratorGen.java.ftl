<#include "GeneratorHelper.ftl">
<#--#####################################################################-->
<#--                                                                   ##-->
<#--         START OF THE OUTPUT                                       ##-->
<#--                                                                   ##-->
<#--#####################################################################-->
/* Date:        ${date}
 * Template:	${template}
 * generator:   ${generator} ${version}
 */

package ${package};

import java.util.ArrayList;
import java.util.List;

import org.molgenis.framework.db.DatabaseException;
import org.molgenis.framework.db.QueryRule;
import org.molgenis.framework.db.jdbc.JDBCMapper;
import org.molgenis.framework.db.jdbc.MappingDecorator;
import org.molgenis.util.CsvReader;
import org.molgenis.util.CsvWriter;

public class ${clazzName}<E extends ${entityClass}> extends MappingDecorator<E>
{
	//JDBCMapper is the generate thing
	public ${clazzName}(JDBCMapper<E> generatedMapper)
	{
		super(generatedMapper);
	}

	@Override
	public int add(List<E> entities) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canWrite(${entityClass}.class))
				throw new DatabaseException("No write permission on ${entityClass}");
			
			//TODO: Add column level security filters
		}
		return super.add(entities);
	}

	@Override
	public int update(List<E> entities) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canWrite(${entityClass}.class))
				throw new DatabaseException("No write permission on ${entityClass}");
			
			//TODO: Add row level security filters
			//TODO: Add column level security filters
		}
		return super.update(entities);
	}

	@Override
	public int remove(List<E> entities) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canWrite(${entityClass}.class))
				throw new DatabaseException("No write permission on ${entityClass}");
				
			//TODO: Add row level security filters
		}
		return super.remove(entities);
	}

	@Override
	public int add(CsvReader reader, CsvWriter writer) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canWrite(${entityClass}.class))
				throw new DatabaseException("No write permission on ${entityClass}");

			//TODO: Add column level security filters
		}
		return super.add(reader, writer);
	}

	@Override
	public int count(QueryRule... rules) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canRead(${entityClass}.class))
				return 0;

			//TODO: Add row level security rules
		}
		return super.count(rules);
	}

	@Override
	public List<E> find(QueryRule ...rules) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canRead(${entityClass}.class))
				return new ArrayList<E>();

			//TODO: Add row level security filters
		}

		List<E> result = super.find(rules);

		//TODO: Add column level security filters

		return result;
	}

	@Override
	public void find(CsvWriter writer, QueryRule ...rules) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canRead(${entityClass}.class))
				return;

			//TODO: Add row level security filters
		}

		super.find(writer, rules);
		//TODO: Add column level security filters. How???
	}

	@Override
	public int remove(CsvReader reader) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canWrite(${entityClass}.class))
				throw new DatabaseException("No write permission on ${entityClass}");

			//TODO: Add row level security filters
		}
		return super.remove(reader);
	}

	@Override
	public int update(CsvReader reader) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canWrite(${entityClass}.class))
				throw new DatabaseException("No write permission on ${entityClass}");

			//TODO: Add row level security filters
			//TODO: Add column level security filters
		}
		return super.update(reader);
	}

	@Override
	public void find(CsvWriter writer, List<String> fieldsToExport, QueryRule ...rules) throws DatabaseException
	{
		if (this.getDatabase().getSecurity() != null)
		{
			if (!this.getDatabase().getSecurity().canRead(${entityClass}.class))
				return;
			
			//TODO: Add row level security filters
		}

		super.find(writer, fieldsToExport, rules);
		//TODO: Add column level security filters. How???
	}
}

