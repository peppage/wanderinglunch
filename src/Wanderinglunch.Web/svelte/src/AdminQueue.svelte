<script>
  import { onMount } from "svelte";

  let data = [];

  onMount(load);

  async function load() {
    const res = await fetch(`/admin/tweets`);
    const json = await res.json();
    data = data.concat(json);
  }

  async function markDone(item) {
    const res = await fetch(`/admin/markdone`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        RequestVerificationToken: document.querySelector(
          'input[name="__RequestVerificationToken"]'
        ).value
      },
      body: JSON.stringify({ id: item.tweet.id })
    });
    if (res.ok) {
      let index = data.indexOf(item);
      data.splice(index, 1);
      data = data;
    }
  }
</script>

<style>

</style>

<table>
  <thead>
    <tr>
      <th>Text</th>
      <th>Locations</th>
      <th />
    </tr>
  </thead>
  <tbody>
    {#each data as dat}
      <tr>
        <td>
           {dat.tweet.text}
          <br />
          <a href="https://twitter.com/{dat.tweet.truckId}">
             {dat.tweet.truckId}
          </a>
          <a
            href="https://twitter.com/{dat.tweet.truckId}/status/{dat.tweet.id}">
             {dat.time}
          </a>
        </td>
        <td>
          {#each dat.locations as loc}{loc.display}{/each}
        </td>
        <td>
          <button on:click={() => markDone(dat)}>Done</button>
        </td>
      </tr>
    {/each}
  </tbody>
</table>
