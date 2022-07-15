#include <stdlib.h>
#include "lru_cache.h"
// Your implementations of cache_new, cache_lookup, cache_insert,
// and cache_clear go in this file.  You must use a least-recently-used
// cache replacement policy.
//
// return a new cache object
CACHE *cache_new(int size)
{
  CACHE *cache = malloc(sizeof(CACHE));
  cache->size = size;
  cache->addr = malloc(size * sizeof(int));
  cache->data = malloc(size * sizeof(float));
  int i;
  for (i = 0; i < cache->size; i++)
  {
    cache->addr[i] = -1;
    cache->data[i] = 0.0;
  }
  return cache;
}
// return data element i if it is cached; else return -1 float
float cache_lookup(CACHE *cache, int i)
{
  int j;
  for (j = 0; j < cache->size; j++)
  {
    if (cache->addr[j] == i)
    {
      int resAddr = i;
      float resData = cache->data[j];
      int k;
      for (k = j; k < cache->size - 1; k++)
      {
        cache->addr[k] = cache->addr[k + 1];
        cache->data[k] = cache->data[k + 1];
      }
      cache->addr[cache->size - 1] = resAddr;
      cache->data[cache->size - 1] = resData;
      return resData;
    }
  }
  return -1.0;
}
// record in the cache that the ith data element has value x
// LRU replacement policy is used
void cache_insert(CACHE *cache, int i, float x)
{
  int j;
  for (j = 0; j < cache->size - 1; j++)
  {
    cache->addr[j] = cache->addr[j + 1];
    cache->data[j] = cache->data[j + 1];
  }
  cache->addr[cache->size - 1] = i;
  cache->data[cache->size - 1] = x;
}
// clear the ith element of the cache
void cache_clear(CACHE *cache, int i)
{
  int j;
  for (j = 0; j < cache->size; j++)
  {
    if (cache->addr[j] == i)
    {
      cache->addr[j] = -1;
      break;
    }
  }
}
