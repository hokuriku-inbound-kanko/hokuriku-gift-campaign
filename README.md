# hokuriku-gift-campaign

日本語のREADMEはこちらです: [README.ja.md](README.ja.md)

Open tourism survey data collected via the [Hokuriku gift campaign](https://welcome-hokuriku.jp), conducted at tourist facilities in Toyama, Ishikawa, and Fukui prefectures using QR code surveys.

## Live Visualization

Explore interactive charts and insights at:
[https://hokuriku-inbound-kanko.github.io/hokuriku-inbound-kanko-visualization/](https://hokuriku-inbound-kanko.github.io/hokuriku-inbound-kanko-visualization/)

## Data Collection

Tourists scan QR codes at participating facilities in the Hokuriku region to submit surveys. Data reflects responses collected through the [welcome-hokuriku.jp](https://welcome-hokuriku.jp) campaign platform.

## Data Format

Daily CSV files are stored in `daily/YYYY-MM-DD.csv` (starting from 2024-09-01). Each file contains timestamped survey responses with standardized fields.

## Key Survey Fields

The dataset includes:

- **Demographics**: Age, gender, nationality, household income
- **Visit Context**: Purpose of visit, number of visits to Japan, travel companions, stay duration, total travel budget
- **Information Sources**: Primary travel information sources, awareness channels for the campaign
- **Spending & Satisfaction**: Facility-specific spending, overall satisfaction, likelihood to recommend
- **Geographic & Operational Data**: Prefecture, area, industry type, facility visit purpose

## Automatic Updates

- Daily SFTP data pull at 3 AM JST from the campaign server
- Automatic Shift-JIS to UTF-8 encoding conversion (if required)
- Automated Git commit and push to GitHub via `update.sh`

## Technology

- **Automation**: Bash scripting (`update.sh`) with `expect` for SFTP interactions
- **Data Conversion**: Deno-based `conv-charset.ts` for encoding normalization

## License

CC-BY 4.0 — [Hokuriku Inbound Tourism DX Data Consortium](https://github.com/hokuriku-inbound-kanko). Attribution required for reuse.
