<script>
  import { onMount } from "svelte";

  let data = [];
  let query = "";

  $: filtered = data.filter(loc => {
    return loc.display.toLowerCase().indexOf(query.toLowerCase()) > -1;
  });

  onMount(load);

  async function load() {
    const res = await fetch(`/admin/locations/locations`);
    const json = await res.json();
    data = data.concat(json);
  }
</script>

<style>
  table {
    width: 100%;
  }
</style>

<input bind:value={query} type="text" placeholder="Search locations" />
<table>
  <thead>
    <tr>
      <th>Display</th>
      <th>Zone</th>
    </tr>
  </thead>
  {#each filtered as loc}
    <tr>
      <td>
        <a href="/admin/location/{loc.id}">{loc.display}</a>
      </td>
      <td>{loc.zone}</td>
    </tr>
  {/each}
</table>
