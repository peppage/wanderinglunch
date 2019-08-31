<script>
  import { onMount } from "svelte";

  let data = [];
  let query = "";

  $: filtered = data.filter(d => {
    return d.name.toLowerCase().indexOf(query.toLowerCase()) > -1;
  });

  onMount(load);

  async function load() {
    const res = await fetch(`/admin/trucks/data`);
    const json = await res.json();
    data = data.concat(json);
  }

  function date(epoch) {
    var d = new Date(epoch * 1000);
    return d.toLocaleString();
  }
</script>

<style>
  table {
    width: 100%;
  }
</style>

<input bind:value={query} type="text" placeholder="Search Trucks" />
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Last Updated</th>
      <th>Archive</th>
    </tr>
  </thead>
  {#each filtered as truck}
    <tr>
      <td>
        <a href="/admin/truck/{truck.twitName}">{truck.name}</a>
      </td>
      <td>{date(truck.lastUpdate)}</td>
      <td>
        {#if truck.archive}Y{/if}
      </td>
    </tr>
  {/each}
</table>
