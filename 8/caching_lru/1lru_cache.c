#include <stdlib.h>
#include "lru_cache.h"

//
// Your implementations of cache_new, cache_lookup, cache_insert,
// and cache_clear go in this file.  You must use a least-recently-used
// cache replacement policy.
//

// return a new cache object
CACHE *cache_new(int size) {
  	CACHE *cache = malloc(sizeof(CACHE));
  	cache->size = size;
  	cache->addr = malloc(size * sizeof(int));
  	cache->data = malloc(size * sizeof(float));

  	int i; 
  	for(i=0; i<cache->size; i++) {
  		cache->addr[i] = -1;
  		cache->data[i] = 0.0;
  	}
  
  	return cache;
}

// i i, return its value,
// else return -1
float cache_lookup(CACHE *cache, int i) {
	int index = -1;
	int j;
	for(j=0; j<cache->size; j++) {
		if(cache->addr[j] == i){
			index = j;
			break;
		}
	}

	if(index != -1){
		int addr = cache->addr[index];
		float data = cache->data[index];
		for(j=index; j>0; j--) {
			cache->addr[j] = cache->addr[j-1];
			cache->data[j] = cache->data[j-1];
		}
		cache->addr[0] = addr;
		cache->data[0] = data;
		return data;
	}
	return -1.0;
}

// record in the cache that the data element with key i has value x
// LRU replacement policy is used
void cache_insert(CACHE *cache, int i, float x) {
	int j;
	for(j = cache->size-1; j>0; j--) {
		cache->addr[j] = cache->addr[j-1];
		cache->data[j] = cache->data[j-1];
	}
	cache->addr[0] = i;
	cache->data[0] = x;
}

// revmoe cache element having key value i, if such an element exists
void cache_clear(CACHE *cache, int i) {
  int j;
  for (j = 0; j < cache->size; j++) {
     if (cache->addr[j] == i) {
        cache->addr[j] = -1;
        break;
     }
  }
}

