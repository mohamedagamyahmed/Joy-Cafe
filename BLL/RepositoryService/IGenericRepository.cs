﻿using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace BLL.RepositoryService
{
    public interface IGenericRepository<TEntity> where TEntity : class
    {
        void AddRange(IEnumerable<TEntity> entities);

        void Edit(TEntity entity);

        void Remove(TEntity entity);

        void RemoveRange(IEnumerable<TEntity> entities);

        int GetRecordsNumber();

        int GetRecordsNumber(Expression<Func<TEntity, bool>> predicate);

        TEntity Add(TEntity entity);

        TEntity Get(int id);

        TEntity SingleOrDefault(Expression<Func<TEntity, bool>> predicate);

        TEntity FirstOrDefault(Expression<Func<TEntity, bool>> predicate);

        IEnumerable<TEntity> Find(Expression<Func<TEntity, bool>> predicate);

        IEnumerable<TEntity> FindSum(Expression<Func<TEntity, bool>> predicate);

        IEnumerable<TEntity> GetAll();
    }
}
