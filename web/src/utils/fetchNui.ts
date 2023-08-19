/**
 * The function fetchNui is used to make a POST request to a specified NUI event endpoint and return
 * the response as JSON.
 * @param {string} eventName - The `eventName` parameter is a string that represents the name of the
 * event that you want to fetch from the NUI (Native UI) frame. It is used to construct the URL for the
 * fetch request.
 * @param {any} data - The `data` parameter is an optional object that contains any additional data
 * that you want to send along with the request. This data will be serialized as JSON and included in
 * the request body. If no `data` object is provided, an empty object will be used as the default
 * value.
 * @returns The function `fetchNui` returns a Promise that resolves to the JSON response from the fetch
 * request.
 */

const resource = (window as any).GetParentResourceName ? (window as any).GetParentResourceName() : 'nui-frame-app'

export async function fetchNui(eventName: string, data: any = {}): Promise<any> {
  try {
    const resp = await fetch(`https://${resource}/${eventName}`, {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(data),
    });

    return await resp.json();
  } catch (error) {
    console.error(error);
  }
}